import React from "react";
import srcURL from '../../srcURL.json'

import './footerStyles.scss'

const Footer = () => {

    const handleScrollToTop = () => {
        window.scrollTo(0, 0)
    }

    return (
        <div className="footer">
            <div className="footer__policy">
                <div className="footer__policy--container">
                    <div className="footer__policy--container__policy">Copyright &copy; 2023 Three Wolves</div>
                    <div className="footer__policy--container__social-icon">
                        <span>Connect with us</span>
                        <img src={srcURL.facebook} alt="face" />
                        <img src={srcURL.twitter} alt="face" />
                        <img src={srcURL.youtube} alt="face" />
                        <img src={srcURL.linkin} alt="face" />
                    </div>
                </div>
            </div>
            <span onClick={handleScrollToTop} className="footer__btn">
                <img src={srcURL.arrowTop} alt="arrow" />
            </span>
        </div>
    )
}

export default Footer;