//
//  ViewController.swift
//  UITableViewCell
//
//  Created by Cntt22 on 4/22/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import Foundation
import UIKit

class EventLine
{
    var day: String         //days in week
    var events: [Event]     //events in day
    
    init(daysOfWeek: String, includeEvents: [Event])
    {
        day = daysOfWeek
        events = includeEvents
    }
    
    class func eventLines() -> [EventLine]
    {
        return [self.Monday(), self.Tuesday(), self.Wednesday(), self.Thursday(), self.Friday(), self.Saturday(), self.Sunday()]
    }
    
	//EventMonday
    private class func Monday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(nameevent: "Đạp xe hóng gió", detail: "Phương pháp tuyệt vời nhất để đốt cháy mỡ thừa và giảm cân nhanh chóng vào mùa hè này là đi xe đạp. Một giờ đi xe đạp với cường độ mạnh có thể giúp bạn giải phóng đến 850 calo. Tuy nhiên, nếu bạn đang sống ở thành phố, hãy mua một chiếc xe đạp tập tại chỗ. Bạn có thể sử dụng bao nhiêu lần tại nhà tùy ý, miễn là uống đủ nước để duy trì độ ẩm cơ thể trong khoảng thời gian này." ))
        events.append(Event(nameevent: "Chơi bóng", detail: "Có rất nhiều trò chơi có thể thực hiện với trái banh: đá banh, chuyền banh, chơi bóng ném..v...v Hoặc trẻ có thể tự tạo nên một trò chơi hoàn toàn mới, biết đâu đấy, phải không nào?"))
        events.append(Event(nameevent: "Du lịch xa", detail: "Bạn không cần phải đổ mồ hôi liên tục trong phòng tập gym nữa. Thay vào đó, hòa mình vào không gian mà ta định hướng tới"))
        events.append(Event(nameevent: "Chạy bộ", detail: "Chạy được coi là phương pháp luyện tập đòi hỏi nhiều sự nỗ lực nhất từ trước đến nay. Hoạt động này làm giảm stress, trầm cảm và giúp bạn cảm thấy có sức sống."))
        events.append(Event(nameevent: "Nghe nhạc", detail: "Nghiên cứu cho thấy bộ não của chúng ta hoạt động tốt hơn sau khi nghe nhạc, nhưng quan trọng phải là thể loại nhạc mà ta yêu thích. Bởi khi yêu thích thì ta mới có cảm hứng."))
        events.append(Event(nameevent: "Đọc sách", detail: "So much homework to complete"))
        events.append(Event(nameevent: "Vẽ tranh", detail: "So much homework to complete"))
        events.append(Event(nameevent: "Tập Yoga", detail: "Các bài tập yoga giảm cân đang được rất nhiều người quan tâm. Đây là những động tác yoga giam can đơn giản, dễ thực hiện mang lại hiệu quả nhanh chóng."))
        events.append(Event(nameevent: "Đọc thật nhanh", detail: "So much homework to complete"))
        events.append(Event(nameevent: "Ngồi thiền", detail: "So much homework to complete..."))
        return EventLine(daysOfWeek: "Monday", includeEvents: events)
    }
    
	//EventTuesday
    private class func Tuesday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(nameevent: "Reading book", detail: "Harry potter, The Rise of Sivagami"))
        events.append(Event(nameevent: "Learn English", detail: "Learn at least 100 words"))
		events.append(Event(nameevent: "Join party", detail: "Going to StarLight club"))
		events.append(Event(nameevent: "Gym", detail: "Complete guide to total gym exercises including animated illustrations and detailed information on more than 75 total gym exercises."))

        return EventLine(daysOfWeek: "Tuesday", includeEvents: events)
    }
    
	//EventWednesday
    private class func Wednesday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(nameevent: "Return book", detail: "Harry potter 3, The Rise of Sivagami 3"))
        events.append(Event(nameevent: "Learn France", detail: "Learn at least 100 words"))
		events.append(Event(nameevent: "Having lunch", detail: "At 1 Vo Van Ngan"))
		events.append(Event(nameevent: "Do exercises", detail: "Complete guide to total exercises."))
        
        return EventLine(daysOfWeek: "Wednesday", includeEvents: events)
    }
    
	//EventThursday
    private class func Thursday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(nameevent: "Swimming", detail: "Swim to the C Challenge"))
        events.append(Event(nameevent: "Swimming extra", detail: "Swim to the F Challenge"))
        events.append(Event(nameevent: "Intimate Violence", detail: "Intimate Violence & Beyond Criminal Justice Interventions"))
        events.append(Event(nameevent: "Arts and Letters", detail: "Arts and Letters Series: J Ryan Stradal"))
        
        return EventLine(daysOfWeek: "Thursday", includeEvents: events)
    }
    
	//EventFriday
    private class func Friday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(nameevent: "Training", detail: "Digital Pedagogy | WORKSHOP"))
        events.append(Event(nameevent: "Seminar", detail: "Career Panel & Networking in the Human Resources Industry"))
        
        return EventLine(daysOfWeek: "Friday", includeEvents: events)
    }
    
	//EventSaturday
    private class func Saturday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(nameevent: "Lecture", detail: "Fourth Quarter: Reflections of a Cranky Old Man"))
        events.append(Event(nameevent: "Exhibition", detail: "PSUSD Showcase Art Exhibition Opening Reception"))
        events.append(Event(nameevent: "Recreation", detail: "Adult Beginner Swim Lessons"))
        
        return EventLine(daysOfWeek: "Saturday", includeEvents: events)
    }
    
	//EventSunday
    private class func Sunday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(nameevent: "Concert", detail: "Carillon Concerts"))
        events.append(Event(nameevent: "Seminar co", detail: "How to Work a Career Fair Room"))
        events.append(Event(nameevent: "Rop lesson", detail: "Top Rope Belay Lesson 5"))
        
        return EventLine(daysOfWeek: "Sunday", includeEvents: events)
    }
}
