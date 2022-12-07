import React from 'react'
import spinner from '../public/spinner.gif'

export default function Loader() {
  return (
    <div className='spinner'>
      <img src={spinner} alt="loading..." />
    </div>
  )
}
