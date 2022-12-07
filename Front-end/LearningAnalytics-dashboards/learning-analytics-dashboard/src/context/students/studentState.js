import React, { useReducer } from 'react'
import axios from 'axios'
import StudentContext from './studentContext'
import studentReducer from './studentReducer'
import {
  GET_STUDENTS_INFO,
  STUDENTS_INFO_ERROR,
  SET_TOPICS,
  ADD_TOPIC,
  REMOVE_TOPIC,
  SET_LOADING,
  SET_GROUP_INFO,
  GET_STUDENTS_FAKE_INFO
} from '../types'

import data from '../../utils/GetContentLevels.json'
import SETTINGS from '../../utils/_Settings.json'

const StudentState = props => {
  const { DOMAIN } = SETTINGS

  const initialState = {
    info: null,
    loading: true,
    error: null,
    group: null,
    topics: [],
    filteredTopics: [],
    learners: []
  }

  const [state, dispatch] = useReducer(studentReducer, initialState)

  // Get students info
  const getInfo = async (queryParams = {}) => {
    try {
      const config = {
        'Accept': 'text/plain'
      }

      const params = {
        usr: queryParams.usr || 'uoa1752021140',
        grp: queryParams.grp || 'UoA174Fall20195',
        sid: queryParams.sid || 'test',
        cid: queryParams.cid || '375',
        mod: queryParams.mod || 'all',
        models: queryParams.models || '0',
        avgtop: queryParams.avgtop || '-1',
        removeZeroProgressUsers: queryParams.removeZeroProgressUsers || 'false',
        dateFrom: queryParams.dateFrom,
        dateTo: queryParams.dateTo
      }

      const requestURL = `${DOMAIN}?usr=${params.usr}&grp=${params.grp}&sid=${params.sid}&cid=${params.cid}&mod=${params.mod}&models=${params.models}&avgtop=${params.avgtop}&removeZeroProgressUsers=${params.removeZeroProgressUsers}${(params.dateFrom && params.dateTo) ? `&dateFrom=${params.dateFrom}&dateTo=${params.dateTo}` : ''}`
      const res = await axios.get(requestURL, config)

      //Gets students data for each topic
      let info = []
      data.learners.forEach(d => {
        const topics = d.state.topics
        const topicsArray = Object.keys(topics).map((key) => {
          const topic = {
            //y: topics[key].overall.a,
            //progress: topics[key].overall.p,
            //successRate: topics[key].overall.s
            x: key,
            progress: Math.random().toFixed(2),
            y: Math.floor(Math.random() * (10 - 1 + 1)),
            successRate: Math.random().toFixed(2),
            show: true
          }
          return topic
        })
        info.push({ id: d.id, data: topicsArray })
      })

      const topics = data.topics.sort((a, b) => {
        let fa = a.id.toLowerCase(),
        fb = b.id.toLowerCase();

        if (fa < fb) {
            return -1;
        }
        if (fa > fb) {
            return 1;
        }
        return 0;
      })

      console.log(topics)

      const payload = {
        learners: info,
        topics: topics,
        group: data.context.group
      }

      dispatch({
        type: GET_STUDENTS_INFO,
        payload
      })

    } catch (err) {
      dispatch({
        type: STUDENTS_INFO_ERROR,
        payload: "Error"
      })
    }
  }

  const addTopic = (topic) => {
    setLoading(true)    
    dispatch({
      type: ADD_TOPIC,
      payload: topic
    })
  }

  const removeTopic = (topic) => {
    setLoading(true)

    setTimeout(() => {
      setLoading(false)
    }, 1000);

    dispatch({
      type: REMOVE_TOPIC,
      payload: topic
    })
  }

  const setLoading = (value) => {
    dispatch({
      type: SET_LOADING,
      payload: value
    })
  }

  return (
    <StudentContext.Provider value={{
      info: state.info,
      loading: state.loading,
      error: state.error,
      group: state.group,
      topics: state.topics,
      filteredTopics: state.filteredTopics,
      students: state.students,
      getInfo,
      addTopic,
      removeTopic,
      setLoading
    }}>
      {props.children}
    </StudentContext.Provider>
  )
}
export default StudentState