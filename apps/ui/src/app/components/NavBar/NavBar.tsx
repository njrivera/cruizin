import {
  AppBar,
  Collapse,
  Drawer,
  List,
  ListItemButton,
  ListItemProps,
  ListItemText,
  Toolbar,
  Typography,
} from '@mui/material';
import { Link as RouterLink } from 'react-router-dom';
import { Box } from '@mui/system';
import { ExpandLess, ExpandMore } from '@mui/icons-material';
import React from 'react';

/* eslint-disable-next-line */
export interface NavBarProps {
  links: LinkProps[];
}

const drawerWidth = 240;

export function NavBar(props: NavBarProps) {
  const { links } = props;

  return (
    <Box sx={{ display: 'flex' }}>
      <AppBar
        position="fixed"
        sx={{ zIndex: (theme) => theme.zIndex.drawer + 1 }}
      >
        <Toolbar>
          <Typography variant="h6">Cruizin Solutions</Typography>
        </Toolbar>
      </AppBar>
      <Drawer
        variant="permanent"
        sx={{
          width: drawerWidth,
          flexShrink: 0,
          [`& .MuiDrawer-paper`]: {
            width: drawerWidth,
            boxSizing: 'border-box',
          },
        }}
      >
        <Toolbar />
        <Box sx={{ overflow: 'auto' }}>
          <List>
            {links.map((link, i) => {
              return link.sublinks && link.sublinks ? (
                <CollapsibleLink {...(link as CollapsibleLinkProps)} key={i} />
              ) : (
                <ListItemLink {...link} key={i} />
              );
            })}
          </List>
        </Box>
      </Drawer>
    </Box>
  );
}

export default NavBar;

interface LinkProps extends ListItemProps {
  text: string;
  to: string;
  sublinks?: LinkProps[];
}

interface ListItemLinkProps extends LinkProps {
  open?: boolean;
}

function ListItemLink(props: ListItemLinkProps) {
  const { text, to, open } = props;

  let icon = null;
  if (open != null) {
    icon = open ? <ExpandLess /> : <ExpandMore />;
  }

  return (
    <li>
      <ListItemButton component={RouterLink as any} {...props}>
        <ListItemText primary={text} />
        {icon}
      </ListItemButton>
    </li>
  );
}

interface CollapsibleLinkProps extends ListItemLinkProps {
  sublinks: ListItemLinkProps[];
}

function CollapsibleLink(props: CollapsibleLinkProps) {
  const [open, setOpen] = React.useState(false);
  const { sublinks } = props;

  return (
    <>
      <ListItemLink {...props} open={open} onClick={() => setOpen(!open)} />
      <Collapse component="li" in={open} timeout="auto" unmountOnExit>
        <List disablePadding>
          {sublinks.map((l, i) => (
            <ListItemLink sx={{ pl: 4 }} text={l.text} to={l.to} key={i} />
          ))}
        </List>
      </Collapse>
    </>
  );
}
