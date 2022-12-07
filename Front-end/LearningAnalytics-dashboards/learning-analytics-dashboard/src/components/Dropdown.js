import React, { useState, useContext } from 'react'
import colorsContext from '../context/colors/colorsContext'


export default function Dropdown({ text = 'Button', actionMethod, content, size }) {
  const ColorsContext = useContext(colorsContext)
  const { palette } = ColorsContext

  const [hovering, setHovering] = useState(false)
  const [showMenu, setShowMenu] = useState(false)

  return (
    <div className="dropdown">
      <button
        className={size === 'bg' ? 'btn--bg' : 'btn'}
        onClick={() => setShowMenu(!showMenu)}
        onMouseEnter={() => setHovering(true)}
        onMouseLeave={() => setHovering(false)}
        type="button"
        style={{ border: `1px solid ${palette[8]}`, backgroundColor: hovering ? palette[5] : '#FFF' }}
      >
        {text} <i className="fa fa-caret-down" aria-hidden="true" />
      </button>

      <div className={showMenu ? (size === 'bg' ? 'dropdown-menu--visible-bg' : 'dropdown-menu--visible') : 'dropdown-menu'}>
        <div className="dp-content">
          {content}
        </div>
      </div>
    </div>
  )
}
