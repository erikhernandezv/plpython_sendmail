CREATE OR REPLACE FUNCTION public.sendmail()
 RETURNS character varying
 LANGUAGE plpython3u
AS $function$

	from email.mime.text import MIMEText
	from smtplib import SMTP

	from_address = "erikdhv@gmail.com"
	to_address = "erikdhv@gmail.com"
	message = "Hello, world!"

	mime_message = MIMEText(message, "plain")
	mime_message["From"] = from_address
	mime_message["To"] = to_address
	mime_message["Subject"] = "Correo de prueba"

	smtp = SMTP("localhost")
	#smtp.login(from_address, "clave")

	smtp.sendmail(from_address, to_address, mime_message.as_string())
	smtp.quit()
	return "Terminó"
    $function$
;