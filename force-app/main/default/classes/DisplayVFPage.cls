public with sharing class DisplayVFPage {
    public DisplayVFPage() {

    }
    public PageReference task1(){
        PageReference vfPage1 = new PageReference('https://mvcloudsprivatelimited4-dev-ed--c.develop.vf.force.com/apex/Taks1');
        vfPage1.setRedirect(true);
        return vfPage1;
        // return null;
    }
    public PageReference task2(){
        PageReference vfPage2 = new PageReference('https://mvcloudsprivatelimited4-dev-ed--c.develop.vf.force.com/apex/Task2');
        vfPage2.setRedirect(true);
        return vfPage2;
    } 
    public PageReference task3(){
        PageReference vfPage3 = new PageReference('https://mvcloudsprivatelimited4-dev-ed--c.develop.vf.force.com/apex/Task2');
        vfPage3.setRedirect(true);
        return vfPage3;
    }
    public PageReference task4(){
        PageReference vfPage4 = new PageReference('https://mvcloudsprivatelimited4-dev-ed--c.develop.vf.force.com/apex/SecondContactList');
        vfPage4.setRedirect(true);
        return vfPage4;
    }
    public PageReference task5(){
        PageReference vfPage5 = new PageReference('https://mvcloudsprivatelimited4-dev-ed--c.develop.vf.force.com/apex/Task5');
        vfPage5.setRedirect(true);
        return vfPage5;
    }
}
