using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Microsoft.Office.Interop.Word;
using System.Text.RegularExpressions;

namespace esmeraldino
{
	public partial class contrato_old : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Upload(object sender, EventArgs e)
        {
            object documentFormat = 8;
            string randomName = DateTime.Now.Ticks.ToString();
            object htmlFilePath = Server.MapPath("~/Temp/") + randomName + ".htm";
            string directoryPath = Server.MapPath("~/Temp/") + randomName + "_files";
            object fileSavePath = Server.MapPath("~/Temp/") + Path.GetFileName(FileUpload1.PostedFile.FileName);

            //If Directory not present, create it.
            if (!Directory.Exists(Server.MapPath("~/Temp/")))
            {
                Directory.CreateDirectory(Server.MapPath("~/Temp/"));
            }

            //Upload the word document and save to Temp folder.
            FileUpload1.PostedFile.SaveAs(fileSavePath.ToString());

            //Open the word document in background.
            _Application applicationclass = new Application();
            applicationclass.Documents.Open(ref fileSavePath);
            applicationclass.Visible = false;
            Document document = applicationclass.ActiveDocument;

            //Save the word document as HTML file.
            document.SaveAs(ref htmlFilePath, ref documentFormat);

            //Close the word document.
            document.Close();

            //Read the saved Html File.
            string wordHTML = System.IO.File.ReadAllText(htmlFilePath.ToString());

            //Loop and replace the Image Path.
            foreach (Match match in Regex.Matches(wordHTML, "<v:imagedata.+?src=[\"'](.+?)[\"'].*?>", RegexOptions.IgnoreCase))
            {
                wordHTML = Regex.Replace(wordHTML, match.Groups[1].Value, "Temp/" + match.Groups[1].Value);
            }

            //Delete the Uploaded Word File.
            System.IO.File.Delete(fileSavePath.ToString());

            dvWord.InnerHtml = wordHTML;
        }
    }
}