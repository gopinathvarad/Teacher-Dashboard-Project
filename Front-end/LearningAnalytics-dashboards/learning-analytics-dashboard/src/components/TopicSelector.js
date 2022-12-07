import React, { useContext, useEffect, useState } from 'react'
import StudentContext from '../context/students/studentContext'
import ColorsContext from '../context/colors/colorsContext'

export default function TopicSelector() {
  const studentContext = useContext(StudentContext)
  const { info, loading, error, topics, addTopic, removeTopic, setLoading } = studentContext

  const colorsContext = useContext(ColorsContext)
  const { palette } = colorsContext

  const [selectAll, setSelectAll] = useState(true)

  
  const changeSelected = () => {
    setLoading(true)
    topics.forEach(topic => {
      setSelectAll(!selectAll)
      if (selectAll) {
        setTimeout(() => {
          removeTopic(topic.id)
          setLoading(false)
        }, 1);
      } else {
        addTopic(topic.id)
      }
    })
  }

  const onChange = (e) => {
    if (!e.target.checked) {
      setLoading(true)
      setTimeout(() => {
        removeTopic(e.target.value)
        setLoading(false)
      }, 1);
    } else {
      addTopic(e.target.value)
    }
  }
  return (
    <>
      {(topics && palette) && (
        <form style={{ display: 'inline-block'}}>
          <input
            type="checkbox"
            id='select-all'
            name='select-all'
            value={selectAll}
            checked={selectAll}
            onChange={() => changeSelected()}
          />
          <label htmlFor='select-all'>{selectAll ? 'Deselect all' : 'Select all'}</label>
          <br />
          <br />
          {topics.map((topic, i) => (
            <div className='topic-div' key={i}>
              <input
                type="checkbox"
                id={topic.id}
                name={topic.id}
                value={topic.id}
                checked={topic.isVisible}
                onChange={onChange}
                style={{ backgroundColor: topic.isVisible ? palette[5] : '#FFF'}}
              />
              <label htmlFor={topic.id}> {topic.name} </label>
            </div>
          ))}
        </form>
      )}
    </>
  )
}
