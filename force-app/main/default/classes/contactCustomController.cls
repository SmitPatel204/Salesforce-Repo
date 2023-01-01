public class contactCustomController {
	public String firstName{get;set;}
    public String lastName{get;set;}
    public String phone{get;set;}
    list <contact> conList;

    public contactCustomController(){
       conlist=new List<contact>();
    }

    public pageReference Save(){
        Contact con = new Contact(firstname = firstname, lastname = lastname, phone = phone);
        conList.add(con);
        insert conList;
        return null; 
   }
}