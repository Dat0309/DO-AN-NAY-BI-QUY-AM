import React from "react";
import { Link } from 'react-router-dom'

import './headerStyles.scss'

const Header = () => {
    return (
        <div className="header">
            <div className="header__logo">
                <Link className="header__logo__navigation" to='/'>
                    <img src='https://identify.plantnet.org/_nuxt/img/plantnet-logo-title.26755cd.svg' alt='logo' />
                </Link>
            </div>
        </div>
    )
}

export default Header;