/*
 * File   : $Source$
 * Date   : $Date$
 * Version: $Revision$
 *
 * This library is part of OpenCms -
 * the Open Source Content Management System
 *
 * Copyright (C) 2002 - 2009 Alkacon Software (http://www.alkacon.com)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * For further information about Alkacon Software, please see the
 * company website: http://www.alkacon.com
 *
 * For further information about OpenCms, please see the
 * project website: http://www.opencms.org
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

package org.opencms.workplace.tools.sites;

import org.opencms.jsp.CmsJspActionElement;
import org.opencms.main.OpenCms;
import org.opencms.module.CmsModule;
import org.opencms.widgets.CmsInputWidget;
import org.opencms.workplace.CmsWidgetDialog;
import org.opencms.workplace.CmsWidgetDialogParameter;
import org.opencms.workplace.tools.CmsToolDialog;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

/**
 * A dialog that allows to write the sites configured in OpenCms
 * into a Apache virtual host configuration file, using a template.<p>
 * 
 * @since 9.0.0
 */
public class CmsSitesApacheVhost extends CmsWidgetDialog {

    /** The module name constant. */
    public static final String MODULE_NAME = "org.opencms.workplace.tools.sites";

    /** Defines which pages are valid for this dialog. */
    public static final String[] PAGES = {"page1"};

    /** The default parameter value. */
    private static final String DEFAULT_CONSOLE_SCRIPT = "/etc/apache2/reload.sh";

    /** The default parameter value. */
    private static final String DEFAULT_TARGET_PATH = "/etc/apache2/sites-enabled/";

    /** The default prefix used for created virtual host configuration files, created by this tool. */
    private static final String DEFAULT_VHOST_PREFIX = "opencms";

    /** The default parameter value. */
    private static final String DEFAULT_VHOST_SOURCE = "/etc/apache2/sites-available/vhost.template";

    /** Module parameter constant for the console action. */
    public static final String PARAM_CONSOLE_SCRIPT = "consolescript";

    /** Module parameter constant for the target path. */
    public static final String PARAM_TARGET_PATH = "targetpath";

    /** A module parameter name for the prefix used for virtual host configuration files. */
    public static final String PARAM_VHOST_PREFIX = "vhostprefix";

    /** Module parameter constant for the virtual host configuration template file. */
    public static final String PARAM_VHOST_SOURCE = "vhostsource";

    /** The script to be executed after updating the virtual host configurations, e.g. "/etc/apache2/reload.sh". */
    private String m_consolescript;

    /** The target path to store the virtual host files. */
    private String m_targetpath;

    /** The prefix used for created virtual host configuration files, created by this tool. */
    private String m_vhostprefix;

    /** The source file used as template for creating a virtual host configuration files. */
    private String m_vhostsource;

    /**
     * Public constructor with JSP action element.<p>
     * 
     * @param jsp an initialized JSP action element
     */
    public CmsSitesApacheVhost(CmsJspActionElement jsp) {

        super(jsp);
    }

    /**
     * Public constructor with JSP variables.<p>
     * 
     * @param context the JSP page context
     * @param req the JSP request
     * @param res the JSP response
     */
    public CmsSitesApacheVhost(PageContext context, HttpServletRequest req, HttpServletResponse res) {

        this(new CmsJspActionElement(context, req, res));
    }

    /**
     * @see org.opencms.workplace.CmsWidgetDialog#actionCommit()
     */
    @Override
    public void actionCommit() throws IOException, ServletException {

        Map<String, String[]> params = new HashMap<String, String[]>();
        params.put(PARAM_CONSOLE_SCRIPT, new String[] {m_consolescript});
        params.put(PARAM_TARGET_PATH, new String[] {m_targetpath});
        params.put(PARAM_VHOST_PREFIX, new String[] {m_vhostprefix});
        params.put(PARAM_VHOST_SOURCE, new String[] {m_vhostsource});
        params.put(PARAM_ACTION, new String[] {DIALOG_INITIAL});
        params.put(PARAM_STYLE, new String[] {CmsToolDialog.STYLE_NEW});
        getToolManager().jspForwardPage(this, CmsSitesList.PATH_REPORTS + "console.jsp", params);
    }

    /**
     * Returns the console script.<p>
     *
     * @return the console script
     */
    public String getConsolescript() {

        return m_consolescript;
    }

    /**
     * Returns the target path.<p>
     *
     * @return the target path
     */
    public String getTargetpath() {

        return m_targetpath;
    }

    /**
     * Returns the virtual host prefix.<p>
     *
     * @return the virtual host prefix
     */
    public String getVhostprefix() {

        return m_vhostprefix;
    }

    /**
     * Returns the virtual host source.<p>
     *
     * @return the virtual host source
     */
    public String getVhostsource() {

        return m_vhostsource;
    }

    /**
     * Sets the console script.<p>
     *
     * @param consolescript the console script to set
     */
    public void setConsolescript(String consolescript) {

        m_consolescript = consolescript;
    }

    /**
     * Sets the target path.<p>
     *
     * @param targetpath the target path to set
     */
    public void setTargetpath(String targetpath) {

        m_targetpath = targetpath;
    }

    /**
     * Sets the virtual host prefix.<p>
     *
     * @param vhostprefix the virtual host prefix to set
     */
    public void setVhostprefix(String vhostprefix) {

        m_vhostprefix = vhostprefix;
    }

    /**
     * Sets the virtual host source.<p>
     *
     * @param vhostsource the vhost source to set
     */
    public void setVhostsource(String vhostsource) {

        m_vhostsource = vhostsource;
    }

    /**
     * @see org.opencms.workplace.CmsWidgetDialog#createDialogHtml(java.lang.String)
     */
    @Override
    protected String createDialogHtml(String dialog) {

        StringBuffer result = new StringBuffer(1024);
        result.append(createWidgetTableStart());
        result.append(createWidgetErrorHeader());
        result.append(dialogBlockStart(Messages.get().getBundle().key(Messages.GUI_SITES_APACHE_TITLE_0)));
        result.append(createWidgetTableStart());
        result.append(createDialogRowsHtml(0, 3));
        result.append(createWidgetTableEnd());
        result.append(dialogBlockEnd());
        result.append(createWidgetTableEnd());
        return result.toString();
    }

    /**
     * @see org.opencms.workplace.CmsWidgetDialog#defineWidgets()
     */
    @Override
    protected void defineWidgets() {

        initMembers();
        setKeyPrefix(CmsSitesList.KEY_PREFIX_SITES);
        addWidget(new CmsWidgetDialogParameter(this, "vhostsource", PAGES[0], new CmsInputWidget()));
        addWidget(new CmsWidgetDialogParameter(this, "vhostprefix", PAGES[0], new CmsInputWidget()));
        addWidget(new CmsWidgetDialogParameter(this, "targetpath", PAGES[0], new CmsInputWidget()));
        addWidget(new CmsWidgetDialogParameter(this, "consolescript", PAGES[0], new CmsInputWidget()));
    }

    /**
     * @see org.opencms.workplace.CmsWidgetDialog#getPageArray()
     */
    @Override
    protected String[] getPageArray() {

        return PAGES;
    }

    /**
     * Initializes the values of the members.<p>
     */
    private void initMembers() {

        CmsModule module = OpenCms.getModuleManager().getModule(MODULE_NAME);
        m_consolescript = module.getParameter(PARAM_CONSOLE_SCRIPT, DEFAULT_CONSOLE_SCRIPT);
        m_targetpath = module.getParameter(PARAM_TARGET_PATH, DEFAULT_TARGET_PATH);
        m_vhostsource = module.getParameter(PARAM_VHOST_SOURCE, DEFAULT_VHOST_SOURCE);
        m_vhostprefix = module.getParameter(PARAM_VHOST_PREFIX, DEFAULT_VHOST_PREFIX);
        setDialogObject(this);
    }
}
