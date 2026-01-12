import './WelcomeItem.css'

function WelcomeItem({ icon, heading, children }) {
  return (
    <div className="welcome-item">
      <i>{icon}</i>
      <div className="details">
        <h3>{heading}</h3>
        {children}
      </div>
    </div>
  )
}

export default WelcomeItem
