import './HelloWorld.css'

function HelloWorld({ msg }) {
  return (
    <div className="greetings">
      <h1 className="green">{msg}</h1>
      <h3>
        You’ve successfully created a project with{' '}
        <a href="https://vite.dev/" target="_blank" rel="noopener noreferrer">
          Vite
        </a>{' '}
        +{' '}
        <a href="https://react.dev" target="_blank" rel="noopener noreferrer">
          React 18
        </a>
        .
      </h3>
    </div>
  )
}

export default HelloWorld
