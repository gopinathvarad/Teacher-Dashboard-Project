import React, {useContext} from 'react'
import { ExportToCsv } from 'export-to-csv';
import studentContext from '../context/students/studentContext';
import Button from './Button'
import Dropdown from './Dropdown';
import ColorPicker from './ColorPicker';
import TopicSelector from './TopicSelector';
import DateRange from './DateRange';

export default function OptionsBar() {
  const StudentContext = useContext(studentContext)
  const { students } = StudentContext

  const exportData = () => {
    let finalData = []
    students.forEach(s => {
      const info = s.data.map(d => {
        return ({
          student: s.id,
          topic: d.x,
          attempts: d.y,
          progress: d.progress,
          successRate: d.successRate
        })
      })
      finalData = finalData.concat(info)
    })

    const options = { 
      fieldSeparator: ',',
      quoteStrings: '',
      decimalSeparator: '.',
      showLabels: true, 
      useTextFile: false,
      useBom: true,
      useKeysAsHeaders: true,
      // headers: ['Column 1', 'Column 2', etc...] <-- Won't work with useKeysAsHeaders present!
    }
   
    const csvExporter = new ExportToCsv(options)
   
    csvExporter.generateCsv(finalData)
  }
  return (
    <div
    style={{
      display: 'flex',
      justifyContent: 'center',
      margin: 'auto',
      width: '80%',
      height :'5rem'
    }}
  >
      <Dropdown text="COLOR SCHEME" content={<ColorPicker />} />
      <Dropdown text="FILTER TOPICS" content={<TopicSelector />} size="bg" />
      <Dropdown text="SELECT A DATE RANGE" content={<DateRange />} size="bg" />
      <Button text="EXPORT TO CSV" actionMethod={exportData}/>
  </div>
  )
}
