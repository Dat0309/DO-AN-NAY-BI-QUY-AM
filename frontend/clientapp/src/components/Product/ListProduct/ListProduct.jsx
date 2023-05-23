import React from 'react'
import "./ListProductStyles.scss"
import Item from '../Item/Item';

const ListProduct = ({ ...props }) => {
    var id = 1;

    return (
        <div className='list'>
            <ul className='listproduct'>
                {
                    props.items.map((i) => (
                        <li key={id++} className='items'>
                            <Item name={i.name} notes={i.notes} image={i.image} especes={i.especes} images={i.images} />
                        </li>
                    ))
                }
            </ul>
        </div>
    )
}

export default ListProduct