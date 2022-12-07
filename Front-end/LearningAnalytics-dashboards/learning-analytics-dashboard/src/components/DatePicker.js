import React from 'react'

export default function DatePicker({ tag, name, date, changeDate}) {
  return (
    <div className='date-picker'>
      {tag && <label htmlFor={name}>{tag}:</label>}
      <input type="date" name={name} value={date} onChange={(e) => changeDate(e)}></input>
    </div>
  )
}
