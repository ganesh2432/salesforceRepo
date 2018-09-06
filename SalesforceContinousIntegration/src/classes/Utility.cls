public class Utility {

    /*****************************************
    Purpose     : Method for getting Record Type Id                                  
    Return Type : Record Id
    *****************************************/
    public static Id getRecordTypeId(String objectType,String recordTypeName){
        Id recTypeId = Schema.getGlobalDescribe().get(objectType).getDescribe().getRecordTypeInfosByName().get(recordTypeName).getRecordTypeId();
        return recTypeId ;      
    }
    
    /*****************************************
    Purpose     : Get's Picklist field values of specified object    
    Param       : @ObjectApi_name is sObject API Name and @Field_name is the field API Name for 
                  which picklist values needed
    Return Type : List<String>
    *****************************************/
    public static List<String> getPicklistValues(String ObjectApi_name,String Field_name){ 
        
        List<String> lstPickvals                        = new List<String>();
        Schema.SObjectType targetType                   = Schema.getGlobalDescribe().get(ObjectApi_name);
        Sobject Object_name                             = targetType.newSObject();
        Schema.sObjectType sobject_type                 = Object_name.getSObjectType(); 
        Schema.DescribeSObjectResult sobject_describe   = sobject_type.getDescribe();
        Map<String, Schema.SObjectField> field_map      = sobject_describe.fields.getMap();
        List<Schema.PicklistEntry> pick_list_values     = field_map.get(Field_name).getDescribe().getPickListValues();
        
        for (Schema.PicklistEntry a : pick_list_values) {
            lstPickvals.add(String.ValueOf(a.getLabel()).trim());
            
        }
        return lstPickvals;
    }
    
}