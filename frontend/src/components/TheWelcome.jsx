import WelcomeItem from './WelcomeItem.jsx'
import IconDocumentation from './icons/IconDocumentation.jsx'
import IconTooling from './icons/IconTooling.jsx'
import IconEcosystem from './icons/IconEcosystem.jsx'
import IconCommunity from './icons/IconCommunity.jsx'
import IconSupport from './icons/IconSupport.jsx'

const openReadmeInEditor = () => fetch('/__open-in-editor?file=README.md')

function TheWelcome() {
  return (
    <>
      <WelcomeItem icon={<IconDocumentation />} heading="Documentation">
        React’s{' '}
        <a href="https://react.dev" target="_blank" rel="noopener noreferrer">
          official documentation
        </a>{' '}
        provides you with all information you need to get started.
      </WelcomeItem>

      <WelcomeItem icon={<IconTooling />} heading="Tooling">
        This project is served and bundled with{' '}
        <a href="https://vite.dev/guide/features.html" target="_blank" rel="noopener noreferrer">
          Vite
        </a>
        . The recommended IDE setup is{' '}
        <a href="https://code.visualstudio.com/" target="_blank" rel="noopener noreferrer">
          VSCode
        </a>{' '}
        +{' '}
        <a href="https://github.com/johnsoncodehk/volar" target="_blank" rel="noopener noreferrer">
          Volar
        </a>
        . If you need to test your components and web pages, check out{' '}
        <a href="https://vitest.dev/" target="_blank" rel="noopener noreferrer">
          Vitest
        </a>{' '}
        and{' '}
        <a href="https://www.cypress.io/" target="_blank" rel="noopener noreferrer">
          Cypress
        </a>{' '}
        /{' '}
        <a href="https://playwright.dev/" target="_blank" rel="noopener noreferrer">
          Playwright
        </a>
        .
        <br />
        More instructions are available in{' '}
        <button type="button" className="link-button" onClick={openReadmeInEditor}>
          <code>README.md</code>
        </button>
        .
      </WelcomeItem>

      <WelcomeItem icon={<IconEcosystem />} heading="Ecosystem">
        Get official tools and libraries for your project:{' '}
        <a href="https://redux.js.org/" target="_blank" rel="noopener noreferrer">
          Redux
        </a>
        ,{' '}
        <a href="https://tanstack.com/query/latest" target="_blank" rel="noopener noreferrer">
          TanStack Query
        </a>
        , and{' '}
        <a href="https://testing-library.com/docs/react-testing-library/intro/" target="_blank" rel="noopener noreferrer">
          Testing Library
        </a>
        . If you need more resources, we suggest paying{' '}
        <a href="https://github.com/enaqx/awesome-react" target="_blank" rel="noopener noreferrer">
          Awesome React
        </a>{' '}
        a visit.
      </WelcomeItem>

      <WelcomeItem icon={<IconCommunity />} heading="Community">
        Got stuck? Ask your question on{' '}
        <a href="https://discord.gg/reactiflux" target="_blank" rel="noopener noreferrer">
          Reactiflux
        </a>{' '}
        (the official React Discord server), or{' '}
        <a href="https://stackoverflow.com/questions/tagged/reactjs" target="_blank" rel="noopener noreferrer">
          StackOverflow
        </a>
        . You should also follow the official{' '}
        <a href="https://bsky.app/profile/react.dev" target="_blank" rel="noopener noreferrer">
          @react.dev
        </a>{' '}
        Bluesky account or the{' '}
        <a href="https://x.com/reactjs" target="_blank" rel="noopener noreferrer">
          @reactjs
        </a>{' '}
        X account for latest news in the React world.
      </WelcomeItem>

      <WelcomeItem icon={<IconSupport />} heading="Support React">
        As an independent project, React relies on community backing for its sustainability. You can
        help by{' '}
        <a href="https://github.com/sponsors/facebook" target="_blank" rel="noopener noreferrer">
          becoming a sponsor
        </a>
        .
      </WelcomeItem>
    </>
  )
}

export default TheWelcome
