import React, { useState, useContext } from 'react'
import colorsContext from '../context/colors/colorsContext'

export default function Button({ text = 'Button', actionMethod }) {
  const ColorsContext = useContext(colorsContext)
  const { palette } = ColorsContext

  const [hovering, setHovering] = useState(false)


  return (
    <button
      className='btn'
      type="button"
      onClick={actionMethod}
      style={{ border: `1px solid ${palette[8]}`, backgroundColor: hovering ? palette[5] : '#FFF' }}
      onMouseEnter={() => setHovering(true)}
      onMouseLeave={() => setHovering(false)}
    >
      {text}
    </button>
  )
}
