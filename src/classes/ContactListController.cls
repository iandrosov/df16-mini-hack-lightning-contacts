public class ContactListController {
    @AuraEnabled
    public static List<Contact> findAll() {
        return [SELECT id, name, phone FROM Contact LIMIT 50];
    }

    // Find account realted conatct
    @AuraEnabled
    public static List<Contact> findByName(String searchKey) {
        try{
            // Account name key search
        String name = '%' + searchKey + '%';
        System.debug('### SEARCH:'+name);
        List<Contact> cnt = new List<Contact>();
        List<Account> acc = [SELECT Id, Name FROM Account WHERE name LIKE :name LIMIT 50];
        if (acc != null && acc.size() > 0)    
        	return [SELECT id, name, phone FROM Contact WHERE AccountId IN :acc LIMIT 100];
        }catch(Exception e){
            System.debug('### ERROR:'+e);
        }
        return new List<Contact>();
    }

    @AuraEnabled
    public static Contact findById(String contactId) {
        return [SELECT id, name, title, phone, mobilephone, Account.Name
                    FROM Contact WHERE Id = :contactId];
    }
}