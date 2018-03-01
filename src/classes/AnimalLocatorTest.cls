@isTest(seeAllData=false)
private class AnimalLocatorTest {
    
    @isTest
    private static void getAnimalNameById(){
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        String value=AnimalLocator.getAnimalNameById(1);
        system.assertEquals('chicken',value);
        System.Test.stopTest();
    }

}