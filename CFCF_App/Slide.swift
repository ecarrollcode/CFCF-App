//
//  Slide.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/27/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit

class Slide: UIView {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var slideNumLabel: UILabel!

    @IBOutlet weak var iPadHeader: UILabel!
    @IBOutlet weak var iPadContent: UILabel!
    @IBOutlet weak var iPadSlideNumLabel: UILabel!
    
    class func getArrOfDicts() -> Array<Dictionary<String, String>> {
        var slideArrOfDicts = Array<Dictionary<String, String>>()
        let bulletPoint: String = "\u{2022}"
        
        var slide1Content = bulletPoint + " Accepts all reports of alleged child abuse and neglect pursuant to T.C.A. 37-1-403\n"
        slide1Content += bulletPoint + " Screens the report to determine if the situation requires a track assignment (Investigation, Assessment, or Resource Linkage).\n"
        slide1Content += bulletPoint + " Conducts investigations or assessments of child abuse and neglect."
        let slide1 = ["s_id": "1",
                      "header": "Tennessee Department of Children's Services\nOffice of Child Safety",
                      "content": slide1Content]
        slideArrOfDicts.append(slide1)
        
        let slide2Content = bulletPoint + "The law makes no distinction between professionals and nonprofessionals on the issue of reporting."
        let slide2 = ["s_id": "2",
                      "header": "Who Is Mandated to Report?",
                      "content": slide2Content]
        slideArrOfDicts.append(slide2)
        
        var slide3Content = bulletPoint + " T.C.A 37-1-403 (a) (1) requires all persons to report suspected cases of child abuse or neglect:\n"
        slide3Content += bulletPoint + " Any person who has knowledge of or is called upon to render aid to any child who is suffering from or has sustained any wound, injury, disability, or physical or mental condition shall report such harm immediately..."
        let slide3 = ["s_id": "3",
                      "header": "The Law",
                      "content": slide3Content]
        slideArrOfDicts.append(slide3)
        
        var slide4Content = bulletPoint + " Judge having juvenile jurisdiction over the child\n"
        slide4Content += bulletPoint + " Department of Children's Services (DCS) local staff, or the utilization of DCS Centralized Intake Procedure (Hotline)\n"
        slide4Content += bulletPoint + " Sheriff in the county where the child resides, or\n"
        slide4Content += bulletPoint + " Chief law enforcement officer in the county where the child resides"
        let slide4 = ["s_id": "4",
                      "header": "Where Can You Report Child Abuse?",
                      "content": slide4Content]
        slideArrOfDicts.append(slide4)
        
        var slide5Content = bulletPoint + " While the law states that you can report suspected child abuse to DCS, Juvenile Court, or the Sheriff or Chief Law Enforcement Officer in the county of the child's residence, many child advocates believe that the Department of Children's "
        slide5Content += "Services is the BEST place to report suspected child abuse. The DCS has the primary responsibility for child welfare services."
        let slide5 = ["s_id": "5",
                      "header": "Where is the Best Place to Report Child Abuse?",
                      "content": slide5Content]
        slideArrOfDicts.append(slide5)
        
        var slide6Content = bulletPoint + " You do not have to have proof that child abuse/neglect has occured in order to report.\n"
        slide6Content += bulletPoint + " The law speaks to making reports based on \"available information\" and in a situation that \"reasonably appears to have been caused by brutality, abuse, neglect, or sexual abuse.\""
        let slide6 = ["s_id": "6",
                      "header": "When is it Appropriate to Make a Report? What if I'm \"just concerned\"?",
                      "content": slide6Content]
        slideArrOfDicts.append(slide6)
        
        var slide7Content = bulletPoint + " Organizations that are Responsible for the Care of Children\n"
        slide7Content += bulletPoint + " This includes clinics, hospitals, schools, child care centers, and residential care facilities."
        let slide7 = ["s_id": "7",
                      "header": "T.C.A. 37-1-403 (h) pertains to:",
                      "content": slide7Content]
        slideArrOfDicts.append(slide7)
        
        var slide8Content = bulletPoint + " Hospitals, clinics, schools, or any other organization responsible for the care of children may develop their own internal reporting procedures.\n"
        slide8Content += bulletPoint + " Individuals who work for these organizations and who have knowledge of suspected child abuse or neglect must report those concerns."
        let slide8 = ["s_id": "8",
                      "header": "Organizations that are Responsible for Care of Children  (continued)",
                      "content": slide8Content]
        slideArrOfDicts.append(slide8)
        
        var slide9Content = bulletPoint + " If a child tells his school teacher that someone has abused him, that teacher has the responsibility to make the report to the proper authorities.\n"
        slide9Content += bulletPoint + " If a child who lives in a residential treatment center tells her therapist that she has been a victim of child abuse, then that therapist is responsible for making the report."
        let slide9 = ["s_id": "9",
                      "header": "Here are Two Examples:",
                      "content": slide9Content]
        slideArrOfDicts.append(slide9)
        
        var slide10Content = bulletPoint + " Do these employees have an obligation to tell their employers that they have made a report?\n"
        slide10Content += bulletPoint + " The law indicates those employers can impose procedures requiring their employees to notify them of a child abuse report:"
        let slide10 = ["s_id": "10",
                       "header": "Employees",
                       "content": slide10Content]
        slideArrOfDicts.append(slide10)
        
        let slide11Content = bulletPoint + " Nothing in this section shall be construed to prohibit any hospital, clinic, school, or other organization responsible for the care of children from developing a specific procedure for internally tracking, reporting, or otherwise monitoring a report made by a member of the organizations's staff..."
        let slide11 = ["s_id": "11",
                       "header": "T.C.A. 37-1-403 (h)",
                       "content": slide11Content]
        slideArrOfDicts.append(slide11)
        
        let slide12Content = bulletPoint + " Nothing in this section shall prevent staff of a hospital or clinic from gathering sufficient information, as determined by the hospital or clinic, in order to make an appropriate medical diagnosis or to provide and document care which is medically indicated..."
        let slide12 = ["s_id": "12",
                       "header": "T.C.A. 37-1-403 (h)  (continued)",
                       "content": slide12Content]
        slideArrOfDicts.append(slide12)
        
        var slide13Content = bulletPoint + " Organizations can develop internal procedures to track, report, and monitor reports of child abuse and neglect made by their staff.\n"
        slide13Content += bulletPoint + " The internal procedure must not inhibit or discourage staff from making reports as required by section (a) of the law."
        let slide13 = ["s_id": "13",
                       "header": "What Does That Mean?",
                       "content": slide13Content]
        slideArrOfDicts.append(slide13)
        
        var slide14Content = bulletPoint + " T.C.A. 37-1-605 (d) (1) was amended in 2008 by adding this subsection pertaining to schools [paraphrased from original]:\n"
        slide14Content += bulletPoint + " If school staff of any kind has knowledge or reasonable cause to suspect that a child may be a victim of child abuse or child sexual abuse occuring on school grounds or while under the care of the school, they must vebally notify the parent or legal guardian that a report has been made."
        let slide14 = ["s_id": "14",
                       "header": "The Law",
                       "content": slide14Content]
        slideArrOfDicts.append(slide14)
        
        var slide15Content = bulletPoint + " T.C.A.37-1-605 (d) (1) continued [paraphrased from original]:\n"
        slide15Content += bulletPoint + " Such verbal notice shall be made in coordination with the Department of Children's Services to the legal guardian within 24 hours from the time the report is submitted. Such notice shall not be sent to any legal guardian if there is reasonable cause to believe that such legal guardian may be the perpetrator."
        let slide15 = ["s_id": "15",
                       "header": "The Law",
                       "content": slide15Content]
        slideArrOfDicts.append(slide15)
        
        var slide16Content = bulletPoint + " School staff who have suspicion of child abuse or child sexual abuse that occured on school property or under school supervision must report.\n"
        slide16Content += bulletPoint + " Legal guardian shall be notified of these concerns in coordination with DCS.\n"
        slide16Content += bulletPoint + " If the legal guardian is suspected of being the perpetrator, the legal guardian shall not be notified."
        let slide16 = ["s_id": "16",
                       "header": "What Does This Mean?",
                       "content": slide16Content]
        slideArrOfDicts.append(slide16)
        
        let slide17Content = bulletPoint + " What happens if someone reports a false allegation of abuse?"
        let slide17 = ["s_id": "17",
                       "header": "False Allegations",
                       "content": slide17Content]
        slideArrOfDicts.append(slide17)
        
        let slide18Content = bulletPoint + " The law states any person who either verbally or by written or printed communication knowingly and maliciously reports or causes, encourages, aids, counsels, or procures another to report a false accusation of child sexual abuse or false accusation that a child has sustained any wound, injury, disability, or physical or mental condition caused by brutality, abuse, or neglect commits a Class E Felony."
        let slide18 = ["s_id": "18",
                       "header": "T.C.A. 37-1-413",
                       "content": slide18Content]
        slideArrOfDicts.append(slide18)
        
        var slide19Content = bulletPoint + " What happens if someone fails to report a suspected case of child abuse and neglect?\n(T.C.A. 37-1-412)\n"
        slide19Content += bulletPoint + " Failure to report is a Class A misdemeanor.\n"
        slide19Content += bulletPoint + " Fine for \"failure to report\" is not to exceed $2,500"
        let slide19 = ["s_id": "19",
                       "header": "Failure To Report",
                       "content": slide19Content]
        slideArrOfDicts.append(slide19)
        
        var slide20Content = bulletPoint + " How do I contact DCS?\n"
        slide20Content += bulletPoint + " A report can be made by phone, fax, internet/web or letter.\n"
        slide20Content += bulletPoint + " Reports should not be made via the web or fax in emergency situations."
        let slide20 = ["s_id": "20",
                       "header": "Contacting DCS",
                       "content": slide20Content]
        slideArrOfDicts.append(slide20)
        
        var slide21Content = "The toll-free numbers are as follows:\n\n"
        slide21Content += "1—877—54ABUSE \n(1—877—5A2—2873) or \n 1—877—237—0004\nSomeone is available 24/7.\n\n"
        slide21Content += "Fax Number: 615-254-6018 (not toll-free)\n\n"
        slide21Content += "Internet: \nhttps://apps.tn.gov/carat/"
        let slide21 = ["s_id": "21",
                       "header": "Child Abuse Hotline",
                       "content": slide21Content]
        slideArrOfDicts.append(slide21)
        
        var slide22Content = bulletPoint + " Takes your information.\n"
        slide22Content += bulletPoint + " Screens the information to determine if the situation will require an investigation or assessment and the priority assignment.\n"
        slide22Content += bulletPoint + " Assess for other services \n(i.e. resource linkage).\n"
        slide22Content += bulletPoint + " All calls are recorded for Quality Assurance."
        let slide22 = ["s_id": "22",
                       "header": "The Tennessee Child Abuse Hotline:",
                       "content": slide22Content]
        slideArrOfDicts.append(slide22)
        
        var slide23Content = bulletPoint + " Tennessee Laws protect persons who report abuse or neglect.\n"
        slide23Content += bulletPoint + " TCA 37-1-401 provides immunity from civil and criminal liability.\n"
        slide23Content += bulletPoint + " Only persons identified by law can receive DCS information.\n"
        slide23Content += bulletPoint + " The general public may make reports without giving their names."
        let slide23 = ["s_id": "23",
                       "header": "Protection to Those Who Report",
                       "content": slide23Content]
        slideArrOfDicts.append(slide23)
        
        var slide24Content = bulletPoint + " Any person who makes a report has the right to know if DCS will investigate/assess the report or screen out the report. If you wish to obtain that information, you can track the status of your referral online at: \nhttps://appstn.gov/carat/\n"
        slide24Content += bulletPoint + " If there is an investigation or assessment, you may be contacted by DCS staff to obtain additional information."
        let slide24 = ["s_id": "24",
                       "header": "What Reporters Can Expect from DCS",
                       "content": slide24Content]
        slideArrOfDicts.append(slide24)
        
        
        var slide25Content = "When you call in a report, the DCS hotline assesses for these decisions:\n"
        slide25Content += bulletPoint + " Is the child curently safe?\n"
        slide25Content += bulletPoint + " Does the information meet criteria for a track assignment?"
        let slide25 = ["s_id": "25",
                       "header": "When A Report \nIs Called In",
                       "content": slide25Content]
        slideArrOfDicts.append(slide25)
        
        var slide26Content = bulletPoint + " The case manager who takes your call will ask many questions about the situation.\n"
        slide26Content += bulletPoint + " Do not be concerned if you do not know the answer to every single question.\n"
        slide26Content += bulletPoint + " The following slides list the types of information that DCS will try to gather:"
        let slide26 = ["s_id": "26",
                       "header": "Giving Information to the Child Abuse Hotline",
                       "content": slide26Content]
        slideArrOfDicts.append(slide26)
        
        var slide27Content = bulletPoint + " Demographic information on the child, including date of birth, address, and phone number\n"
        slide27Content += bulletPoint + " Name of child's parents/caregiver\n"
        slide27Content += bulletPoint + " Name of siblings of the child\n"
        slide27Content += bulletPoint + " Details of the abuse or neglect - any physical evidence - injuries, behaviors, or environmental conditions\n"
        let slide27 = ["s_id": "27",
                       "header": "Information the Child Abuse Hotline Will Ask For",
                       "content": slide27Content]
        slideArrOfDicts.append(slide27)
        
        var slide27bContent = bulletPoint + " Name of the alleged perpetrator/person who may have abused or neglected the child, relationship to the victim, and if that person currently has access to the child.\n"
        slide27bContent += bulletPoint + " Child's current whereabouts?\n"
        slide27bContent += bulletPoint + " How did you come to know about the abuse/neglect?\n"
        slide27bContent += bulletPoint + " Is there any danger for the DCS investigator?\n"
        let slide27b = ["s_id": "27b",
                        "header": "Information the Child Abuse Hotline Will Ask For   (continued - 2)",
                        "content": slide27bContent]
        slideArrOfDicts.append(slide27b)
        
        var slide28Content = bulletPoint + " Who else knows the circumstances?\n"
        slide28Content += bulletPoint + " Are you aware of anyone or available resource for the child or family? (e.g. friend, relative, mentor, etc.)\n"
        slide28Content += bulletPoint + " What is the non-offending parent or caregiver's feelings toward the child and reaction to the abuse?"
        let slide28 = ["s_id": "28",
                       "header": "Information the Child Abuse Hotline Will Ask For   (continued - 3)",
                       "content": slide28Content]
        slideArrOfDicts.append(slide28)
        
        var slide29Content = bulletPoint + " DCS Follows a 1-2-3 Priority System\n"
        slide29Content += bulletPoint + " Priority 1 - Immediate - 24 hours: \nReports that indicate imminent threat of serious harm or death.\n"
        slide29Content += bulletPoint + " Priority 2 - Two business days: \nInjuries or risk of injuries that are not life threatening and do not require immediate medical care.\n"
        let slide29 = ["s_id": "29",
                       "header": "When Will the DCS Respond?",
                       "content": slide29Content]
        slideArrOfDicts.append(slide29)
        
        let slide29bContent = bulletPoint + " Priority 3 - Three business days: \nReports that indicate a low risk of harm."
        let slide29b = ["s_id": "29b",
                        "header": "When Will the DCS Respond?  (continued)",
                        "content": slide29bContent]
        slideArrOfDicts.append(slide29b)
        
        var slide30Content = bulletPoint + " Will someone respond to the family before the end of the day?\n"
        slide30Content += bulletPoint + " When there is an imminent threat of serious harm, DCS will send a case manager out immediately.\n"
        slide30Content += bulletPoint + " If you feel strongly that a child must be seen that day, then be sure to discuss your specific concerns with the case manager at the Child Abuse Hotline when you make the report."
        let slide30 = ["s_id": "30",
                       "header": "Response Time",
                       "content": slide30Content]
        slideArrOfDicts.append(slide30)
        
        var slide31Content = "When DCS responds, they will do the following:\n"
        slide31Content += bulletPoint + " Conduct an investigation or assessment to determine whether or not the report is accurate.\n"
        slide31Content += bulletPoint + " If necessary, they will take steps to keep the child safe.\n"
        slide31Content += bulletPoint + " Offer services to help the family and that will make the child safe so that he or she can remain in the home."
        let slide31 = ["s_id": "31",
                       "header": "Allegations of Maltreatment",
                       "content": slide31Content]
        slideArrOfDicts.append(slide31)
        
        var slide32Content = bulletPoint + " If not, can we make the child safe without removing the child from the family?\n"
        slide32Content += bulletPoint + " If we must remove the child, how can we preserve his/her relationships with family, friends, school, and the community?"
        let slide32 = ["s_id": "32",
                       "header": "Is The Child Safe?",
                       "content": slide32Content]
        slideArrOfDicts.append(slide32)
        
        var slide33Content = bulletPoint + " Are there state laws that dictate how DCS responds to abuse?\n"
        slide33Content += bulletPoint + " Yes. In 2005 legislation was passed providing for the implementation of a Multiple Response System (MRS).\n"
        slide33Content += bulletPoint + " The MRS system reform moves away from solely investigating in the traditional incident-based manner and moves towards a more strengths-based, family assessment oriented approach for some reports."
        let slide33 = ["s_id": "33",
                       "header": "State Laws on Response to Abuse",
                       "content": slide33Content]
        slideArrOfDicts.append(slide33)
        
        let slide34Content = bulletPoint + " MRS is guided by the principle that using a multiple response system is a more effective approach toward the preservation of families and the best interests of children. This allows DCS to reserve resources for their more intensive, high risk cases."
        let slide34 = ["s_id": "34",
                       "header": "State Laws on Response to Abuse  (continued)",
                       "content": slide34Content]
        slideArrOfDicts.append(slide34)
        
        var slide35Content = bulletPoint + " Ensures children are safe\n"
        slide35Content += bulletPoint + " Avoids negative labels for parents\n"
        slide35Content += bulletPoint + " Sets aside the issue of fault\n"
        slide35Content += bulletPoint + " Asserts that families are the experts at solving their own problems\n"
        slide35Content += bulletPoint + " Works in partnership with parents to identify the family's strengths and needs"
        let slide35 = ["s_id": "35",
                       "header": "The MRS approach:",
                       "content": slide35Content]
        slideArrOfDicts.append(slide35)
        
        var slide36Content = bulletPoint + " The multiple response is a three-track response approach that responds to reports of child abuse and neglect through a system linked to one of three tracks:\n"
        slide36Content += bulletPoint + " Investigation,\n"
        slide36Content += bulletPoint + " Assessment, or\n"
        slide36Content += bulletPoint + " Resource Linkage."
        let slide36 = ["s_id": "36",
                       "header": "Meaning of Multiple Response System",
                       "content": slide36Content]
        slideArrOfDicts.append(slide36)
        
        var slide37Content = bulletPoint + " Responds to reports of sexual and severe maltreatment - the clear cut cases.\n"
        slide37Content += bulletPoint + " Child Protective Services workers work in collaboration with local law enforcement in an effort to have these cases prosecuted.\n"
        slide37Content += bulletPoint + " Purpose of this track is to uncover abuse, identify victims and perpetrators, and make a classification."
        let slide37 = ["s_id": "37",
                       "header": "The Investigation Track:",
                       "content": slide37Content]
        slideArrOfDicts.append(slide37)
        
        var slide38Content = bulletPoint + " Responds to low risk allegations of maltreatment.\n"
        slide38Content += bulletPoint + " CPS workers assess the family strengths and needs to determine the best intervention to stabilize the family.\n"
        slide38Content += bulletPoint + " Uses a strengths-based approach and involves the family as part of the decision making to solve their problems."
        let slide38 = ["s_id": "38",
                       "header": "The Assessment Track:",
                       "content": slide38Content]
        slideArrOfDicts.append(slide38)
        
        var slide39Content = bulletPoint + " This track is a network of available resources to assist children and families in need of services without further intervention of the formal child welfare system.\n"
        slide39Content += bulletPoint + " This track is designed to connect families with existing resources in their community in order to keep their children safe."
        let slide39 = ["s_id": "39",
                       "header": "The Resource Linkage Track:",
                       "content": slide39Content]
        slideArrOfDicts.append(slide39)
        
        let slide40Content = bulletPoint + " This concludes the training presentation."
        let slide40 = ["s_id": "40",
                       "header": "End of Presentation",
                       "content": slide40Content]
        slideArrOfDicts.append(slide40)
        
        
        return slideArrOfDicts
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
