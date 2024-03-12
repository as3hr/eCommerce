import axios from "axios";

const sendTemplateMail = async (
  templateId: string,
  destinationEmail: string,
  templateData: object
) => {
  try{
    const response = await axios.post(
    "https://api.sendgrid.com/v3/mail/send",
    {
      template_id: templateId,
      from: {
        email: "customerservice@alisuq.com",
        name: "Bus Buddy Transport System",
      },
      personalizations: [{  
      to: [
        {
          email: destinationEmail,
        },
      ]}
      ],
    },
    { headers: { Authorization: `Bearer ${process.env.SENDGRID_API_KEY}` } }
  );

  if (response.status >= 200 && response.status < 300) {
    return { success: true };
  } else {
    return {
      success: false,
      code: "mail-error",
      message: response.data.errors,
    };
  }
} 
  catch(error: any){
    console.log(error.response.data.errors);
    return error;
  }
  
};

export { sendTemplateMail };