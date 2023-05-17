//Sidebar imports
import {
    UilEstate,
    UilClipboardAlt,
    UilUsersAlt,
    UilPackage,
    UilPagelines,
    UilMoneyWithdraw,
    UilImageV
} from "@iconscout/react-unicons";


//Sidebar Data
export const SidebarData = [
    {
        icon: UilEstate,
        heading: "Trang thống kê",
        router: "/"
    },
    {
        icon: UilMoneyWithdraw,
        heading: "Quản lý dữ liệu cây trồng",
        router: "/plantsdata"
    },
    {
        icon: UilUsersAlt,
        heading: "Quản lý người dùng",
        router: "/users"
    },
    {
        icon: UilPackage,
        heading: 'Quản lý danh mục',
        router: "/category"
    },
    {
        icon: UilPagelines,
        heading: 'Quản lý cây trồng',
        router: "/plants"
    },
]