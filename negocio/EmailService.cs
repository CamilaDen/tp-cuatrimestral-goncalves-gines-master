﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("noresponderclinicasiempre@gmail.com", "hcdgaaxinlzlbuof");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void armarCorreo(string emailDestino, string asunto, string cuerpo) {

            email = new MailMessage();
            email.From = new MailAddress("noresponder@clinicasiempre.com");
            email.To.Add(emailDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = cuerpo;
        }

        public void enviarMail() {
            try
            {
                server.Send(email);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
    }
}
