import { Footer, Header, Identify, Result } from "../../components"

import './homeStyles.scss'

const Home = () => {
    return (
        <div className="home">
            <Header />
            <Identify />
            <Result />
            <Footer />
        </div>
    )
}

export default Home;