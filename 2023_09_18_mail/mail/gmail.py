import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from smtplib import SMTPException
import sys
import json


# Add plain text content
with open("./message.json", 'r', encoding='utf-8') as json_file:
    message = json.load(json_file)
# Address list
with open("./address.json", 'r', encoding='utf-8') as json_file:
    addressArr = json.load(json_file)
# Sent address
with open("./sent.json", 'r', encoding='utf-8') as json_file:
    sentArr = json.load(json_file)
# Not existing address
with open("./missing.json", 'r', encoding='utf-8') as json_file:
    missingArr = json.load(json_file)

smtp_server = 'smtp.gmail.com'
smtp_port = 587
smtp_username = 'yuki.hiroshi0917@gmail.com'
smtp_password = 'zxco rgpx gbxt qqsi'

for index, item in enumerate(addressArr):
    if item in sentArr or item in missingArr:
        continue
    # Create a mail object
    mailObj = MIMEMultipart()
    mailObj['Subject'] = message["subject"]
    mailObj['From'] = 'jackson.andrew2244@gmail.com'
    mailObj.attach(MIMEText(message["content"], 'plain'))
    mailObj['To'] = item
    # Set up the SMTP server connection (Gmail in this example)
    # Send the email
    try:
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(smtp_username, smtp_password)

        server.sendmail(smtp_username, item, mailObj.as_string())
        print(f"Sent to {index} / {item}")
        sentArr.append(item)
        server.quit()
    except SMTPException as e:
        # Handle SMTP-specific exception
        print(f"SMTPException occurred: {e}")
        server.quit()
# Close the SMTP server connection
with open("sent.json", "w") as json_file:
    json.dump(sentArr, json_file, indent=4)