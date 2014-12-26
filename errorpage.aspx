<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
//randomly generates images for the captcha
    private string GetImage()
    {
        Dictionary<string, string> pictures = new Dictionary<string, string>(); 
        Random rand = new Random();
        pictures.Add("line", "line.jpg");
        pictures.Add("ROOF", "ROOF.jpg");
        pictures.Add("CLEAN", "CLEAN.jpg");
        
        return pictures.ElementAt(rand.Next(0, pictures.Count)).Value; 
        
    }
    void Page_Load()//sets image id as myCaptcha
    {       
        myCaptcha.ImageUrl = GetImage();            
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtChar.Text == "ROOF".ToString())
        {
            lblmsg.Text = "<b>YOUR EMAIL HAS BEEN SENT.";
        }
        else if (txtChar.Text == "CLEAN".ToString())
        {
            lblmsg.Text = "<b>YOUR EMAIL HAS BEEN SENT.";
        }
        else if (txtChar.Text == "line".ToString())
        {
            lblmsg.Text = "<b>YOUR EMAIL HAS BEEN SENT.";   
        }
        else
        {
            Response.Redirect("errorpage.aspx");
        }
        
    }
   
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Amazon Forgot Password</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />    <!--CSS--> 
</head>
<body>
    
    <form id="form1" runat="server">
       
    <div class="padding">

    <table>
        <tr>
            <td align ="left">
                <asp:Image 
                    ID="AmzLogo" 
                    ImageUrl="~/amazon1.png"  
                    NavigateURL ="http://www.amazon.com" 
                    runat="server" /> 
            </td>
       
            <td align="right" align="top"> 
                <div class="Help">
                    <a href="https://www.amazon.com/gp/css/homepage.html/ref=ap_frn_ya" >Your Account</a>  |   
                    <a href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_frn_help?ie=UTF8">Help</a>
                </div>
            </td>
        </tr>
    </table>
    
         <fieldset style="border: thin solid #888888 ">                                              <!--border color of form-->
             <fieldset style =" border: thin solid #f00">
        <table>
            <tr>
                <td>
                    <p style="font-family:Verdana;color:red"><b>There was a problem with your request</b><br />
                        We're sorry. We weren't able to identify you given the information<br /> provided.
                        
                    </p>
                </td>
            </tr>
        </table>
    </fieldset>
         <table>
            <tr>
                <td>
                <p class="headingFont" style="font-family: Verdana; color: #FF9900"><b>Amazon.com Password Assistance</b></p>       
                Enter the e-mail address associated with your Amazon.com account, then <br />
                click Continue. We'll email you a link to a page where you can easily create <br />
                a new password. 
                </td>
            </tr>
         </table>

                <br /> 

             <b><asp:Label ID="EmailInput" runat="server" Text="Email Address:"></asp:Label></b>

             
    <asp:TextBox 
        ID="txtEmail" 
        runat="server">
    </asp:TextBox><!--textbox for email-->
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" 
                runat="server" 
                ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtEmail" 
                Text="Email address is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator 
                ID="RegularExpressionValidator1" 
                runat="server" 
                ErrorMessage="Invalid" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="txtEmail"></asp:RegularExpressionValidator><!--validates for email and its correct format-->
             
             
    <br />

    <h3 style="font-family: Verdana; color: #FF9900">Type the characters you see in this image.</h3>

    <br />

    <asp:Label
         ID="lblmsg" 
         runat="server"   
         Text="Image:">             
     </asp:Label>
     <br/>
    <a href="recoverpassword.aspx">Try a different image.</a> <!--reloads the page for a different captcha-->
    
    <asp:ImageMap 
        ID="myCaptcha" 
        runat="server"
        >
    </asp:ImageMap>

    <br />

    <asp:Label
         ID="CharLabel" 
         runat="server"         
         Text="Type characters:">
     </asp:Label>
     <br/>
     <a href="https://www.amazon.com/gp/help/contact-us/general-questions.html/ref=is_auth_captcha_fp?type=email&skip=true#csTop">
                Having trouble or sight impaired.</a>

    <asp:TextBox 
        ID="txtChar" 
        runat="server">
    </asp:TextBox>
              <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator2" 
                runat="server" 
                ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtChar" 
                Text="Please enter captcha"></asp:RequiredFieldValidator>

    <br />
        
    <asp:ImageButton 
        onclick ="Button1_Click"
        ID="ImgCont" 
        ImageUrl="~/continue.png"
        runat="server" />

        <br /> 
   
    <b>Has your e-mail address changed?</b> If you no longer use the e-mail <br />
    address associated with your Amazon.com account, you may contact <br />
    <a href="https://www.amazon.com/gp/help/contact-us/general-questions.html/ref=ap_cs_forgot_pwd?ie=UTF8&nodeId=&type=email&skip=true&initialIssue=forgotpw#csTop">
        Customer Service</a>  for help restoring access to your account. 

    </fieldset>

    </div>
            
    </form>

    <div align="center" class="Botpad">

    <p class="font"> <a href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_footer_condition_of_use?ie=UTF8&nodeId=508088&pop-up=1" 
            target="blank"> Conditions of Use</a>
        
        <a href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_footer_privacy_notice?ie=UTF8&nodeId=468496&pop-up=1"
            target="blank"> Privacy Notice</a>
            
            © 1996-2013, Amazon.com, Inc. or its affiliates</p>

    </div>

</body>
</html> 