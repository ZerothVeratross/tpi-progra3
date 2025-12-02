using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class EmailServicio
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailServicio()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("clinicamedicaprogramacion3@gmail.com", "dffc zics byhn nguo");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public int enviarCodigo(string emailDestino)
        {
            try
            {
                email = new MailMessage();
                email.From = new MailAddress("clinicamedicaprogramacion3@gmail.com");
                email.To.Add(emailDestino);
                email.Subject = ("Código para recuperar la contraseña.");
                email.IsBodyHtml = true;
                Random random = new Random();
                int codigo = random.Next(100000, 999999);
                email.Body = $@"
                <!doctype html>
                <html>
                  <head>
                    <meta charset='utf-8'>
                    <meta name='viewport' content='width=device-width,initial-scale=1'>
                  </head>
                  <body style='margin:0;padding:0;font-family:Arial,Helvetica,sans-serif;background:#f4f4f6;'>
                    <table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='padding:30px 0;'>
                      <tr>
                        <td align='center'>
                          <table role='presentation' width='600' cellpadding='0' cellspacing='0' style='background:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 4px 18px rgba(0,0,0,0.08);'>
                            <tr>
                              <td style='background:#111; padding:18px 24px; text-align:left;'>
                                <h1 style='color:#234a6f; font-size:20px; margin:0;'>RECUPERACIÓN DE CONTRASEÑA</h1>
                              </td>
                            </tr>
                            <tr>
                              <td style='padding:28px 36px; color:#333; font-size:15px; line-height:1.5;'>
                                <p style='margin:0 0 12px;'>Hola!,</p>

                                <p style='margin:0 0 18px;'>
                                  Para continuar, usá el siguiente código de verificación:
                                </p>

                                <div style='text-align:center; margin:18px 0;'>
                                  <span style='display:inline-block; font-size:28px; letter-spacing:4px; font-weight:700; background:linear-gradient(90deg,#fff 0%, #fff 100%); padding:14px 22px; border-radius:8px; border:2px dashed #234a6f; color:#111;'>
                                    {codigo}
                                  </span>
                                </div>

                                <p style='margin:0 0 12px; color:#666;'>
                                  Si no solicitaste este código, podés ignorar este correo. Para mayor seguridad, no compartas el código con nadie.
                                </p>

                                <p style='margin:18px 0 0; font-size:13px; color:#999;'>
                                  Saludos,<br/>
                                  Grupo 2 - Programación 3
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td style='background:#fafafa; padding:12px 36px; text-align:center; font-size:12px; color:#888;'>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </body>
                </html>";
                return codigo;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (SmtpException ex)
            {
                throw new Exception("Error sending email: " + ex.Message, ex);
            }
        }
    }
}
