/* Description: Reusable methods for Test class
* 
*/
public class Utility_Test {
    
    /*
*@purpose    : get Test User record for Test Class
*@peturn Type: User
*/
    public static User createUser(string dummyusername){
        String user_id = userinfo.getUserId();
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        User dummyUser = new User(Alias = 'abcuser', Email='Zycusstandarduser@testorg.com', 
                                  EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                                  LocaleSidKey='en_IN', ProfileId = p.Id,TimeZoneSidKey='Asia/Kolkata',UserName=dummyusername);
        return dummyUser;
    }
}