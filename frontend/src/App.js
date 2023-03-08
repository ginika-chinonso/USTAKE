import { BrowserRouter as Router, Routes, Route} from "react-router-dom";
import Home from "./components/Home";
import Layout from "./components/shared/Layout";
import Stake from "./components/Stake";
import AddLiquidity from "./components/AddLiquidity";
import Swap from "./components/Swap";

function App() {
  return (
    <div>
      <Router>
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route path="/" element={<Home />}/>
            <Route path="/stake" element={<Stake />}/>
            <Route path="/addliquidity" element={<AddLiquidity />}/>
            <Route path="/swap" element={<Swap />}/>
          </Route>
        </Routes>
      </Router>
    </div>
  );
}

export default App;
