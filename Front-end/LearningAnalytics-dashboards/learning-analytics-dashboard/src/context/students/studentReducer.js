import {
  GET_STUDENTS_INFO,
  STUDENTS_INFO_ERROR,
  SET_TOPICS,
  FILTER_TOPICS,
  ADD_TOPIC,
  REMOVE_TOPIC,
  SET_LOADING,
  SET_GROUP_INFO,
  GET_STUDENTS_FAKE_INFO
} from '../types'

// eslint-disable-next-line import/no-anonymous-default-export
export default (state, action) => {
  switch (action.type) {
    case GET_STUDENTS_INFO:
      return {
        ...state,
        students: action.payload.learners,
        topics: action.payload.topics,
        group: action.payload.group,
        loading: false
      }
    
    case GET_STUDENTS_FAKE_INFO:
      return {
        ...state,
        info: action.payload,
        loading: false
      }
    
    case SET_TOPICS:
      return {
        ...state,
        loading: false,
        topics: action.payload
      }
    
    case ADD_TOPIC:
      return {
        ...state,
        loading: false,
        topics: state.topics.map(t => {
          if (t.id === action.payload)
            t.isVisible = true
            return t
        }),
        students: state.students.map(student => {
          const hidden = student.hidden.filter(t => t.x !== action.payload)
          const checkedTopic = student.hidden.filter(t => t.x === action.payload)
          const data = student.data.concat(checkedTopic)
          return {id: student.id, data, hidden}
        }),
      }
    
    case REMOVE_TOPIC:
      return {
        ...state, 
        topics: state.topics.map(t => {
          if (t.id === action.payload)
          t.isVisible = false
          return t
        }),
        students: state.students.map(student => {
          let visible = student.data.filter(topic => topic.x !== action.payload)
          let hidden = student.hidden ?
          student.hidden.concat(student.data.filter(topic => topic.x === action.payload))
          : student.data.filter(topic => topic.x === action.payload)
          
          return {id: student.id, data: visible, hidden}
        }),
        loading: false,
      }
    
    case SET_LOADING: 
      return {
        ...state,
        loading: action.payload
      }
    
    case SET_GROUP_INFO:
      return {
        ...state,
        group: action.payload
      }
    
    case STUDENTS_INFO_ERROR:
      return {
        ...state,
        error: action.payload,
        loading: false
      }
    
    default:
      return state
  }
}