public class SecondContactList{

    public Integer Blocksize = 10;
    public Integer Index = 0;
    public Integer Count;

    String searchKey;
    List<Contact> results;

    public SecondContactList(){
        Count = [SELECT COUNT() FROM Contact];
    }

    public String getSearchKey(){
        return searchKey;
    }
    public void setSearchKey(String input){
        searchKey = input;
    }

    public List<Contact> getResults(){
        if(searchKey == null || searchKey.length() < 1 || searchKey == ''){
            return [SELECT Id,Lastname,Phone FROM Contact ORDER BY LastName LIMIT : Blocksize OFFSET : Index];
        }
        return results;
    }

    public pagereference search(){
        results = [SELECT Id, Lastname,Phone FROM Contact WHERE name LIKE : '%'+searchKey+'%' LIMIT : Blocksize];
        return null;
    }  

    // public void ClearRecord(){
    //     results.clear();    
    // }

    public void FirstPage(){ 
        Index = 0;
    }

    public void NextPage(){
        Index = Index + Blocksize;
    }

    public void PreviousPage(){
        Index = Index - Blocksize;
    }

    public void LastPage(){
        Index =  Count - Blocksize;
    }

    public BOOLEAN getPrev(){
        if(Index == 0)
            return true;
        else
            return false;    
    }
 
}

