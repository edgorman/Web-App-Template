import { render, screen } from '@testing-library/react';
import App from './App';

test('renders frontend name', () => {
  render(<App />);
  const linkElement = screen.getByText(/{{cookiecutter.frontend_name}}/i);
  expect(linkElement).toBeInTheDocument();
});
