import NavBar from './components/NavBar/NavBar';
import { Routes, Route, MemoryRouter } from 'react-router-dom';

export function App() {
  return (
    <div>
      <MemoryRouter initialIndex={0}>
        <Routes>
          <Route path="*" element={<div />} />
        </Routes>
        <NavBar links={getLinks()} />
      </MemoryRouter>
    </div>
  );
}

export default App;

function getLinks() {
  return [
    {
      text: 'Home',
      to: '/home',
    },
    {
      text: 'Info',
      to: '/info',
      sublinks: [
        {
          text: 'Customers',
          to: '/info/customers',
        },
        {
          text: 'Vehicles',
          to: '/info/vehicles',
        },
      ],
    },
    {
      text: 'Inventory',
      to: '/inventory',
      sublinks: [
        {
          text: 'Tires',
          to: '/inventory/tires',
        },
        {
          text: 'Rims',
          to: '/inventory/rims',
        },
        {
          text: 'Parts',
          to: '/inventory/parts',
        },
        {
          text: 'Services',
          to: '/inventory/services',
        },
        {
          text: 'Packages',
          to: '/inventory/packages',
        },
      ],
    },
  ];
}
