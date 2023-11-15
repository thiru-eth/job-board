
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** Contract for Workers **/

contract    CApplicant {
    /*function add_Applicant ();
    function get_Applicant ();
    
    function apply_Job ();
    function get_ApplicantType();

    function rate_Applicant();
    function get_Applicant_Rating();*/

    //Structure to hold Applicant Data
    struct stApplicant {
              string sName;
              string sLocation;
              string sApplicant_Type;
              uint nYoE; 
              uint nApplicationNo;
        }

        stApplicant[] private Applicants; 

    function add_Applicant ( string memory Name, string memory Location,
                             string memory Application_Type, uint YoE)  external  returns (uint) {
        
        uint nTemp;
        nTemp = new_Applicant( Name, Location, Application_Type, YoE);
        return nTemp;
        }


    function new_Applicant ( string memory Name, string memory Location,
                             string memory Application_Type, uint YoE)  internal returns (uint) {

        /* Applicant Details:
            Applicant Name
            Applicant Aadhar card
            Applicant location
            Applicant Type : Carpenter, Painter, Electrician, Plummer, Sweeper, Driver, Cleaner
            Total YOE
            Store above details in structure
        */

        stApplicant memory stTemp;
        uint nTempNo;

        stTemp.sName = Name;
        stTemp.sLocation = Location;
        stTemp.sApplicant_Type = Application_Type;
        stTemp.nYoE = YoE;
        stTemp.nApplicationNo = Applicants.length + 10001;
        Applicants.push(stTemp);
        nTempNo = stTemp.nApplicationNo;
        return (nTempNo);
       
    }

    function Get_Total_Applicants() public  returns (uint){
        return Applicants.length;
    }


   function Get_Application_Details( uint ApplicationNo) public  returns (string memory , string memory , 
                                                                         string memory , uint, uint) { 

       stApplicant memory stTemp;

       stTemp = Get_App_Details (ApplicationNo);
       return ( stTemp.sName, stTemp.sLocation, stTemp.sApplicant_Type, stTemp.nYoE, stTemp.nApplicationNo);
   }

   function Get_App_Details( uint ApplicationNo) internal view returns (stApplicant memory) {

       stApplicant memory stTemp;

       for (uint i=0; i< Applicants.length; i++) {
           
           if (ApplicationNo == Applicants[i].nApplicationNo){
               stTemp = Applicants[i];
               break;
           }
           else
           {
               continue;
           }

       }

       return stTemp;

   }

   function Get_All_Applicant_Details() pure public {

       stApplicant memory stTemp;
//
       

   }


}

    /*
    function get_Applicant () {

        // Get applicant de3tails from the structure
    }
    function get_ApplicantType() {
        /* Fetch the list of applicants from DB *\
    }
    function apply_Job () {
        /* In order to apply for a Job, Applicant need to be able to see the Jobs
        Step 1: Serach Functionality same as GetAppliant Type
        Step 2: Appicant Need to be able to Pickup a Job to Apply*\ 

    }

    function rate_Applicant(){
        /* Only Admin will rate the applicant
        Ratuing is from 1 to 5, 5 Being the highest *\

    }
    function get_Applicant_Rating() {
        /* Just reteun the rating state variable *\

    }
}
*/

/*
contract CJob {
   /* function add_NewJob();
    function get_JobDetails(); *

    function add_NewJob(){
        /* Job Details:
        Job Name
        Job Skill
        Job Location
        Job Salary 
        Store abovce details in structure *
    }

    function get_JobDetails(){
        /* Get the details from Structure and Display *
    }

}
*/