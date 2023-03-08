import React from "react";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import { Link } from "react-router-dom";

const Navbar = () => {
    return (
        <div>
            <Link to="/">USTAKE</Link>
            <ul>
                <li><Link to="/">Home</Link></li>
                <li><Link to="/stake">Stake</Link></li>
                <li><Link to="/addliquidity">Add Liquidity</Link></li>
                <li><Link to="/swap">Swap</Link></li>
            </ul>
            <ConnectButton />
        </div>
    )
}

export default Navbar;