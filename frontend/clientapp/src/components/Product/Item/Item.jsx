import React from 'react'
import "./ItemStyles.scss"

const Item = ({ ...props }) => {

    const { name, notes, especes, images } = props;

    return (
        <div className='item'>
            <div className='image' style={{ backgroundImage: `url(${props.image})` }}></div>
            <div className='content'>
                <h3 className='name'>{name}</h3>
                <div className='notes'>{notes}</div>
                <div className='data'>
                    <div className='especes'> <span className='numble'>{especes}</span><span>species</span></div>
                    <div className='images'> <span className='numble'>{images}</span><span>images</span></div>
                </div>
            </div>
        </div>
    )
}

export default Item