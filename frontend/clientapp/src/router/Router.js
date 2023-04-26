import React from "react";
import { Home } from "../pages";
import { createBrowserRouter } from 'react-router-dom'

const Router = createBrowserRouter([
    {
        path: "/",
        element: <Home />
    },
])

export default Router;