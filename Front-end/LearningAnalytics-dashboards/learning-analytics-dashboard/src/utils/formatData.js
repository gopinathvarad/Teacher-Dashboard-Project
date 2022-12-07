export default function formatData(data, num) {
  let info = []


  const fakeStudents = Array.from(Array(num).keys()).map(n => {
    const fakeStudent = {
      id: `s00${n}`,
      state: data[0].state
    }
    return fakeStudent
  })

  data = data.concat(fakeStudents)

  const res = data.map(d => {
    const topics = d.state.topics
    const topicsArray = Object.keys(topics).map((key) => {
      const topic = {
        //y: topics[key].overall.a,
        //progress: topics[key].overall.p,
        //successRate: topics[key].overall.s
        x: key,
        progress: Math.random().toFixed(2),
        y: Math.floor(Math.random() * (10 - 1 + 1)),
        successRate: Math.random().toFixed(2)
      }
      return topic
    })
    info.push({ id: d.id, data: topicsArray })
  })

  return info
}