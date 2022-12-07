import React, { useState } from 'react'
import DatePicker from './DatePicker'

export default function DateRange() {
  const [dateFrom, setDateFrom] = useState('')
  const [dateTo, setDateTo] = useState('')

  const changeInitialDate = (e) => {
    setDateFrom(e.target.value)
  }

  const changeFinalDate = (e) => {
    setDateTo(e.target.value)
  }

  const filterByDate = () => {
    console.log({dateFrom, dateTo})
  }
  
  return (
    <div className='date-range'>
      <DatePicker name="initial-date" date={dateFrom} changeDate={changeInitialDate} />
      <DatePicker name="final-date" date={dateTo} changeDate={changeFinalDate} />
      <button className='btn-filter' type="button" onClick={() => console.log('first')}>APPLY</button>
    </div>
  )
}
