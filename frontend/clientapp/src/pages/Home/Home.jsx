import { Footer, Header, Identify } from "../../components"

import './homeStyles.scss'

const Home = () => {
    return (
        <div className="home">
            <Header />
            <Identify />
            {/* <Result /> */}
            <Footer />
        </div>
    )
}

export default Home;