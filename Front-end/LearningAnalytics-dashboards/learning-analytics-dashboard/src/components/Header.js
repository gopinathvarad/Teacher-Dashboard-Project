import React, { useContext } from 'react'
import StudentContext from '../context/students/studentContext'

export default function Header() {
  const studentContext = useContext(StudentContext)
  const { group } = studentContext

  return (
    <div className='header'>
      <h2>Welcome to Teacher Learning-Analytics Dashboard</h2>
      <br />
      {group && (
        <>
          <h3 >Course: {group.name}</h3>
          <span>id: {group.id}</span>
        </>
      )}
    </div>
  )
}
