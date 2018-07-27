//
//  EventCommentsListViewModel.swift
//  EventsIOS
//
//  Created by Luis Castillo on 27/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation

class EventCommentsListViewModel {
    
    public var eventCommentViewModel: [EventCommentsViewModel] = [EventCommentsViewModel]()
    private var eventCommentModel: EventCommentsModel
    
    init(commentModel:EventCommentsModel){
        self.eventCommentModel = commentModel
        getComments()
    }
    
    private func getComments(){
        let comments = self.eventCommentModel.getAllComments()
        self.eventCommentViewModel = comments.map{ item in
            return EventCommentsViewModel(comments: item)
        }
    }
    
}
