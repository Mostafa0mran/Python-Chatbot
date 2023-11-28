from flask import Flask, render_template, request,redirect, url_for,session
from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer
import mysql.connector
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from datetime import timedelta
from googlesearch import search
from class_chatgpt import Gpt_API

import os
from dotenv import load_dotenv
load_dotenv()
email_token = os.getenv('EMAIL_TOKEN')

# Create a new chatbot instance
chatbot = ChatBot('MyChatBot')
# Create a connection to the MySQL database
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="6984125",
  database="chatbot"
)
app = Flask(__name__)
app.secret_key = '5800d5d9e4405020d527f0587538abbe'  # Set a secret key for session
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(minutes=5)

# Create a new chatbot
# chatbot = ChatBot('MyChatBot')

# Create a new trainpython er for the chatbot
conversation = [
    "Hello",
    "Hi there!",
    "How are you?",
    "I am doing well.",
    "That is good to hear.",
    "Thank you.",
    "You are welcome.",
    "Goodbye",
    "Goodbye!",
"What's your name?",
"I'm Mostafa's Ai Bot",
"How are you doing today?",
"I don't have emotions, but I'm always ready to assist you with any questions or problems you have.",
"What time is it?",
"Use /google and ask for the time",
"What's the weather like?",
"Use /google and ask for the weather",
"Where are you from?",
"I was created by Mostafa.",
"What's your favorite color?",
"As an AI language model, I don't have personal preferences or opinions.",
"Do you have any hobbies?",
"I don't have personal hobbies, but I enjoy helping people find answers and solve problems.",
"What do you do for fun?",
"I don't have personal interests, but I'm always learning and expanding my knowledge base through natural language processing and machine learning algorithms.",
"What's your favorite type of music?",
"As an AI language model, I don't have personal preferences or opinions.",
"What's your favorite food?",
"As an AI language model, I don't have personal preferences or opinions.",
"What's your favorite movie?",
"As an AI language model, I don't have personal preferences or opinions.",
"What's your favorite book?",
"As an AI language model, I don't have personal preferences or opinions.",
"Do you have any pets?",
"I don't have a physical body or the ability to have pets, but I can provide information on a wide range of topics, including pets and animal care.",
"How old are you?",
"I was created in 2023, but as an AI language model, I don't have an age in the traditional sense.",
"What's your job?",
"My job is to assist you with any questions or problems you have through natural language processing and machine learning algorithms.",
"What's your favorite sport?",
"As an AI language model, I don't have personal preferences or opinions.",
"What's your favorite holiday?",
"As an AI language model, I don't have personal preferences or opinions.",
"What's your favorite season?",
"As an AI language model, I don't have personal preferences or opinions.",
"What's your favorite place to visit?",
"As an AI language model, I don't have personal preferences or opinions.",
"Do you have any siblings?",
"I don't have a family in the traditional sense, but I work alongside other AI language models to assist people like you."
"What's the difference between artificial intelligence and machine learning?",
"Artificial intelligence (AI) refers to the broader concept of creating intelligent machines that can perform tasks that typically require human-like intelligence, such as learning, problem-solving, and decision-making. Machine learning is a subset of AI that involves teaching machines to learn and improve on their own without being explicitly programmed.",
"How do I improve my programming skills?",
"To improve your programming skills, you can practice coding regularly, read books and articles on programming, take online courses or tutorials, participate in coding challenges or hackathons, and seek feedback from other programmers.",
"Can you explain machine learning to me?",
"Machine learning is a type of artificial intelligence that involves training computer programs to learn from data and improve over time. Instead of being explicitly programmed, machine learning algorithms use statistical models and algorithms to analyze and make predictions based on patterns in the data.",
"How do you work?",
"I use natural language processing and machine learning algorithms to understand and respond to user queries. I analyze the context of the question and use my database of knowledge to generate a relevant response.",
"Can you tell me a little bit about yourself?",
"I'm an Ai Bot, a language model trained by Mostafa. I'm designed to answer a wide range of questions and engage in natural language conversations.",
]

# Train the chatbot on the English corpus
trainer = ListTrainer(chatbot)
trainer.train(conversation)

@app.route("/")
def login():
    return render_template("info.html")
@app.route('/process_form', methods=['POST','GET'])
def process_form():
    name = request.form['username']

    email = request.form['email']
    print("FOrm entered")
    session['filled_form'] = True  # Set session variable indicating form filled out
    # Do something with the form data
    return redirect(url_for('chat', username=str(name), email= str(email)))


@app.route("/chat/<username>/<email>")
def chat(username,email):
    if session.get('filled_form'):
        context = {"username":username, "email":email}
        return render_template("chat.html",**context)
    else:
        return redirect(url_for('login'))

@app.route("/get/<username>/<email>")
def get_bot_response(username,email):
    user_text = request.args.get("msg")
    if user_text.startswith("/google"):
        result="Here are the links that we found related to the search query: \\n"
        search_text = user_text.replace("/google","")
        for j in search(search_text, tld="co.in", num=5, stop=5, pause=2):
            result=f'{result}'+j+"\\n"
        bot_response= f'{result}'
    elif user_text not in conversation:
        obj = Gpt_API(user_text)
        bot_response = obj.get_result()

    else:
        bot_response = str(chatbot.get_response(user_text))
        print(bot_response)
    mycursor = mydb.cursor()
    sql = "INSERT INTO chathistory (username,email,user_msg, bot_message) VALUES (%s,%s,%s, %s)"
    val = (username,email,user_text, bot_response)
    mycursor.execute(sql, val)
    mydb.commit()
    return bot_response

@app.route("/send_mail/<username>/<email>")
def send_mail(username,email):
    mycursor = mydb.cursor()
    # Collect all the conversations matching the email
    sql = "SELECT user_msg, bot_message FROM chathistory WHERE email = %s"
    val = (email,)
    mycursor.execute(sql, val)
    conversations = mycursor.fetchall()

    # Write the conversations to a text file
    filename = f"{email}_conversations.txt"
    with open(filename, "w") as f:
        for conversation in conversations:
            f.write(f"User: {conversation[0]}\n")
            f.write(f"Bot: {conversation[1]}\n")
            f.write("\n")

    # Send the file as an email attachment
    with open(filename, "r") as f:
        contents = f.read()

    msg = MIMEMultipart()
    msg['From'] = "aichatbotprojectmet@gmail.com"
    msg['To'] = email
    msg['Subject'] = "Chatbot Conversation History"
    body = "Please find attached the conversation history with the chatbot."
    msg.attach(MIMEText(body, 'plain'))
    attachment = MIMEText(contents, 'plain')
    attachment.add_header('Content-Disposition', 'attachment', filename=filename)
    msg.attach(attachment)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login("aichatbotprojectmet@gmail.com", email_token) # replace with actual email and password
    text = msg.as_string()
    server.sendmail("aichatbotprojectmet@gmail.com", email, text)
    server.quit()
    return redirect(url_for('chat', username=str(username), email= str(email)))
if __name__ == "__main__":
    app.run(host='0.0.0.0',port=8080,debug=True)


