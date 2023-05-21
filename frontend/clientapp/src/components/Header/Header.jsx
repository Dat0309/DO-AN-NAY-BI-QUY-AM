import React from "react";
import { Link } from 'react-router-dom'
import logo from '../../assets/images/logo.png'
import './headerStyles.scss'

const Header = () => {
    return (
        <div className="header">
            <div className="header__logo">
                <Link className="header__logo__navigation" to='/'>
                    <img src={logo} alt='logo' />
                </Link>
            </div>
        </div>
    )
}

export default Header;