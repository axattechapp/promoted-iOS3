//
//  SignUpModel.swift
//  promoted
//
//  Created by Vikram Sindhu on 18/01/23.
//

import Foundation
import UIKit

class matchedCandidateModal{
    var post_id:Int
    var title:String?
    var thumbnail:String?
    
    init(data:[String:Any])
    {
        self.post_id = Int.getInt(data["post_id"])
        self.title = String.getString(data["title"])
        self.thumbnail = String.getString(data["thumbnail"])
    }
}


class faqScreenModal
{
    var question:String?
    var answer:String?
    
    init(data:[String:Any])
    {
        self.question = String.getString(data["question"])
        self.answer = String.getString(data["answer"])
        
    }
}


class jobListingModal
{
    var user_id:Int?
    var job_listing_id:Int?
    var role:String?
    var company_name:String?
    var city_state_postcode:String?
    var created_at:String?
    var updated_at:String?
    var profile_image:String?
    
    init(data:[String:Any])
    {
        self.user_id = Int.getInt(data["user_id"])
        self.job_listing_id = Int.getInt(data["job_listing_id"])
        self.role = String.getString(data["role"])
        self.company_name = String.getString(data["company_name"])
        self.city_state_postcode = String.getString(data["city_state_postcode"])
        self.created_at = String.getString(data["created_at"])
        self.updated_at = String.getString(data["updated_at"])
        self.profile_image = String.getString(data["profile_image"])
        
    }
}

class planListingModal
{
    var id:Int?
    var plan_id:String?
    var plan_name:String?
    var product:String?
    var amount:Int?
    var created_at:String?
    var updated_at:String?
    var interval:String?
    var currency:String?
    var job_count:Int?
    var offer_benefit:String?
    
    init(data:[String:Any])
    {
        self.id = Int.getInt(data["id"])
        self.amount = Int.getInt(data["amount"])
        self.plan_id = String.getString(data["plan_id"])
        self.plan_name = String.getString(data["plan_name"])
        self.product = String.getString(data["product"])
        self.created_at = String.getString(data["created_at"])
        self.updated_at = String.getString(data["updated_at"])
        self.interval = String.getString(data["interval"])
        self.currency = String.getString(data["currency"])
        self.offer_benefit = String.getString(data["offer_benefit"])
        self.job_count = Int.getInt(data["job_count"])
        
        
    }
}

class userInterViewModal
{
    var interview_id:Int?
    var scheduled_by:Int?
    var scheduled_by_name:String?
    var company_name:String?
    var city_state_postcode:String?
    var company_email:String?
    var company_type:String?
    var phone:String?
    var profile_image:String?
    var status:String?
    var job_role:String?
    var position:String?
    var note:String?
    var video_call:Int?
    var date:String?
    var time_available:String?
    var customise_time_with_candidate:Int?
    
    init(data:[String:Any])
    {
        self.interview_id = Int.getInt(data["interview_id"])
        self.scheduled_by = Int.getInt(data["scheduled_by"])
        self.company_email = String.getString(data["company_email"])
        self.company_type = String.getString(data["company_type"])
        self.company_name = String.getString(data["company_name"])
        self.city_state_postcode = String.getString(data["city_state_postcode"])
        self.scheduled_by_name = String.getString(data["scheduled_by_name"])
        self.phone = String.getString(data["phone"])
        self.profile_image = String.getString(data["profile_image"])
        self.status = String.getString(data["status"])
        self.job_role = String.getString(data["job_role"])
        self.position = String.getString(data["position"])
        self.note = String.getString(data["note"])
        self.date = String.getString(data["date"])
        self.time_available = String.getString(data["time_available"])
        self.video_call = Int.getInt(data["video_call"])
        self.customise_time_with_candidate = Int.getInt(data["customise_time_with_candidate"])
        
    }
}


class userChatModal
{
    var user_id:Int?
    var name:String?
    var role:String?
    var company_name:String?
    var city_state_postcode:String?
    var email:String?
    var phone:String?
    var profile_image:String?
    var unread_messages:Int?
    var unread_messages_ids : String?
    
    init(data:[String:Any])
    {
        self.user_id = Int.getInt(data["user_id"])
        self.name = String.getString(data["name"])
        self.role = String.getString(data["role"])
        self.company_name = String.getString(data["company_name"])
        self.city_state_postcode = String.getString(data["city_state_postcode"])
        self.email = String.getString(data["email"])
        self.phone = String.getString(data["phone"])
        self.profile_image = String.getString(data["profile_image"])
        self.unread_messages = Int.getInt(data["unread_messages"])
        self.unread_messages_ids = String.getString(data["unread_messages_ids"])
        
    }
}

class userNotiModal
{
    var user_id:Int?
    var type:String?
    var company_name:String?
    var city_state_postcode:String?
    var email:String?
    var phone:String?
    var profile_image:String?
    
    init(data:[String:Any])
    {
        self.user_id = Int.getInt(data["id"])
        self.type = String.getString(data["company_name"])
        self.company_name = String.getString(data["company_name"])
        self.city_state_postcode = String.getString(data["city_state_postcode"])
        self.email = String.getString(data["email"])
        self.phone = String.getString(data["phone"])
        self.profile_image = String.getString(data["profile_image"])
        
    }
}


class JobExpModal{
    var company_name:String?
    var job_role:String?
    var experience_from_month:String?
    var experience_from_year:String?
    var experience_to_month:String?
    var experience_to_year:String?
    
    init(data:[String:Any])
    {
        self.company_name = String.getString(data["company_name"])
        self.job_role = String.getString(data["job_role"])
        self.experience_from_month = String.getString(data["experience_from_month"])
        self.experience_from_year = String.getString(data["experience_from_year"])
        self.experience_to_month = String.getString(data["experience_to_month"])
        self.experience_to_year = String.getString(data["experience_to_year"])
    }
}






class ChatScreenModal{
    var id:Int?
    var chat_room_id:String?
    var sender_id:String?
    var receiver_id:String?
    var message:String?
    var created_at:String?
    var date:String?
    var time:String?
    var document:String?
    var profile_image:String?
    var is_file:Int?
    var file_type:String?
    
    init(data:[String:Any])
    {
        self.id = Int.getInt(data["id"])
        self.chat_room_id = String.getString(data["chat_room_id"])
        self.sender_id = String.getString(data["sender_id"])
        self.receiver_id = String.getString(data["receiver_id"])
        self.message = String.getString(data["message"])
        self.created_at = String.getString(data["created_at"])
        self.date = String.getString(data["date"])
        self.time = String.getString(data["time"])
        self.document = String.getString(data["document"])
        self.profile_image = String.getString(data["profile_image"])
        self.is_file = Int.getInt(data["is_file"])
        self.file_type = String.getString(data["file_type"])
    }
}

class experinceModal
{
    var job_role:String?
    var company_name:String?
    var experience_from_month:String?
    var experience_from_year:String?
    var experience_to_month:String?
    var experience_to_year:String?
    
    init(data:[String:Any])
    {
        self.job_role = String.getString(data["job_role"])
        self.company_name = String.getString(data["company_name"])
        self.experience_from_year = String.getString(data["experience_from_year"])
        self.experience_from_month = String.getString(data["experience_from_month"])
        self.experience_to_year = String.getString(data["experience_to_year"])
        self.experience_to_month = String.getString(data["experience_to_month"])
        
    }
}

class industryListModal
{
    var id:Int?
    var name:String?
    var created_at:String?
    var updated_at:String?
    
    init(data:[String:Any])
    {
        self.id = Int.getInt(data["id"])
        self.name = String.getString(data["name"])
        self.created_at = String.getString(data["created_at"])
        self.updated_at = String.getString(data["updated_at"])
        
    }
}

class roleListModal
{
    var id:Int?
    var job_role:String?
    var industry_id:Int?
    var industry:String?
    
    init(data:[String:Any])
    {
        self.id = Int.getInt(data["id"])
        self.job_role = String.getString(data["job_role"])
        self.industry_id = Int.getInt(data["industry_id"])
        self.industry = String.getString(data["industry"])
        
    }
}


class ShortlistScreenModal
{
    var id:Int?
    var name:String?
    var first_name:String?
    var email:String?
    var phone:Int?
    var city:String?
    var job_title:String?
    var company_name:String?
    var experience_from_year:String?
    var experience_from_month:String?
    var experience_to_year:String?
    var experience_to_month:String?
    var job_type : String?
    var industry: String?
    var position : String?
    var salary: String?
    var contract_length : String?
    var have_relevant_experience: Int?
    var educational_level : String?
    var have_professional_accrediation: Int?
    var title : String?
    var issuer: String?
    var willing_to_relocate : Int?
    var portfolio: String?
    var video : String?
    var profile_image: String?
    var percentage : String?
    var unread_messages : Int?
    var unread_messages_ids : String?
    
    
    init(data:[String:Any])
    {
        self.id = Int.getInt(data["id"])
        self.name = String.getString(data["name"])
        self.first_name = String.getString(data["first_name"])
        self.email = String.getString(data["email"])
        self.phone = Int.getInt(data["phone"])
        self.city = String.getString(data["city"])
        self.job_title = String.getString(data["job_title"])
        self.company_name = String.getString(data["company_name"])
        self.experience_from_year = String.getString(data["experience_from_year"])
        self.experience_from_month = String.getString(data["experience_from_month"])
        self.experience_to_year = String.getString(data["experience_to_year"])
        self.experience_to_month = String.getString(data["experience_to_month"])
        self.job_type = String.getString(data["job_type"])
        self.industry = String.getString(data["industry"])
        self.position = String.getString(data["position"])
        self.salary = String.getString(data["salary"])
        self.contract_length = String.getString(data["contract_length"])
        self.have_relevant_experience = Int.getInt(data["have_relevant_experience"])
        self.educational_level = String.getString(data["educational_level"])
        self.have_professional_accrediation = Int.getInt(data["have_professional_accrediation"])
        self.title = String.getString(data["title"])
        self.issuer = String.getString(data["issuer"])
        self.willing_to_relocate = Int.getInt(data["willing_to_relocate"])
        self.portfolio = String.getString(data["portfolio"])
        self.video = String.getString(data["video"])
        self.profile_image = String.getString(data["profile_image"])
        self.percentage = String.getString(data["profile_matched_percentage"])
        self.unread_messages = Int.getInt(data["unread_messages"])
        self.unread_messages_ids = String.getString(data["unread_messages_ids"])
    }
}

class homeScreenModal
{
    var id:Int?
    var name:String?
    var first_name : String?
    var email:String?
    var phone:Int?
    var city:String?
    var job_title:String?
    var company_name:String?
    var experience_from_year:String?
    var experience_from_month:String?
    var experience_to_year:String?
    var experience_to_month:String?
    var job_type : String?
    var industry: String?
    var position : String?
    var salary: String?
    var contract_length : String?
    var have_relevant_experience: Int?
    var educational_level : String?
    var have_professional_accrediation: Int?
    var title : String?
    var issuer: String?
    var willing_to_relocate : Int?
    var portfolio: String?
    var video : String?
    var profile_image: String?
    var profile_matched_percentage : Int?
    
    
    init(data:[String:Any])
    {
        self.id = Int.getInt(data["id"])
        self.name = String.getString(data["name"])
        self.first_name = String.getString(data["first_name"])
        self.email = String.getString(data["email"])
        self.phone = Int.getInt(data["phone"])
        self.city = String.getString(data["city"])
        self.job_title = String.getString(data["job_title"])
        self.company_name = String.getString(data["company_name"])
        self.experience_from_year = String.getString(data["experience_from_year"])
        self.experience_from_month = String.getString(data["experience_from_month"])
        self.experience_to_year = String.getString(data["experience_to_year"])
        self.experience_to_month = String.getString(data["experience_to_month"])
        self.job_type = String.getString(data["job_type"])
        self.industry = String.getString(data["industry"])
        self.position = String.getString(data["position"])
        self.salary = String.getString(data["salary"])
        self.contract_length = String.getString(data["contract_length"])
        self.have_relevant_experience = Int.getInt(data["have_relevant_experience"])
        self.educational_level = String.getString(data["educational_level"])
        self.have_professional_accrediation = Int.getInt(data["have_professional_accrediation"])
        self.title = String.getString(data["title"])
        self.issuer = String.getString(data["issuer"])
        self.willing_to_relocate = Int.getInt(data["willing_to_relocate"])
        self.portfolio = String.getString(data["portfolio"])
        self.video = String.getString(data["video"])
        self.profile_image = String.getString(data["profile_image"])
        self.profile_matched_percentage = Int.getInt(data["profile_matched_percentage"])
    }
}
