import { SidebarData } from "../../Data/SidebarData"
import React, { useState } from 'react'
import { UilBars } from '@iconscout/react-unicons'
import { UilSignOutAlt } from '@iconscout/react-unicons'
import { motion } from 'framer-motion'
import { Link } from 'react-router-dom'

import './SidebarStyles.scss'

const Sidebar = () => {

    const [selected, setSelected] = useState(0);
    const [expanded, setExpanded] = useState(true);

    const sidebarVariants = {
        true: {
            left: '0'
        },
        false: {
            left: '-60%'
        }
    }

    return (
        <>
            <div className="bars" style={expanded ? { left: '60%' } : { left: '5%' }} onClick={() => setExpanded(!expanded)}>
                <UilBars />
            </div>
            <motion.div className='sidebar'
                variants={sidebarVariants}
                animate={window.innerWidth <= 768 ? `${expanded}` : ''}
            >
                <div className="logo">
                    <img src='https://identify.plantnet.org/_nuxt/img/plantnet-logo-title.26755cd.svg' alt="logo" />
                </div>
                <div className="title">
                    <p>Đồ án tốt nghiệp</p>
                </div>

                <div className="menu">
                    {SidebarData.map((item, index) => {
                        return (
                            <Link
                                className={`sidebarItem ${selected === index ? "menuItem active" : "menuItem"}`}
                                key={index}
                                onClick={() => setSelected(index)}
                                to={item.router}
                            >
                                <item.icon />
                                <span>{item.heading}</span>
                            </Link>
                        );
                    })}
                    {/* signoutIcon */}
                    <div className="menuItem">
                        <UilSignOutAlt />
                    </div>
                </div>
            </motion.div>
        </>
    )
}

export default Sidebar