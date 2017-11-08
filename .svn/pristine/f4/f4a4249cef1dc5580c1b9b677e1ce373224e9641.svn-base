package internal.qaauto.inrunning.framework;

import internal.qaauto.framework.ConfigManager;
import internal.qaauto.framework.testCase.webTestsCase.BaseTestCase;
import internal.qaauto.inrunning.tom.Utilties.LiveBettingPageFactory;
import internal.qaauto.inrunning.tom.betslip.BetSlip;
import internal.qaauto.inrunning.tom.betslip.BetSlipModeComponent;
import internal.qaauto.inrunning.tom.betslip.BetSlipSelection;
import org.apache.commons.configuration.ConfigurationException;
import org.jbehave.core.annotations.*;

import java.io.IOException;
import java.util.List;

/**
 * Created by Harish Renukunta on 09/10/2014.
 */
public class InRunningTestCase extends BaseTestCase {

    protected static ScenarioContext scenarioContext;

    protected static ExecutionContext executionContext;

    public static ScenarioContext getScenarioContext() {
        return scenarioContext;
    }

    public static ExecutionContext getExecutionContext() {
        return executionContext;
    }

    @BeforeStory
    public void beforeStory() throws Exception {
        setTestProperties(ConfigManager.getConfig().getString("domain.id"));
        startBrowser();
        cleanCookies();
        if (executionContext == null) {
            executionContext = new ExecutionContext();
        }
    }

    @BeforeScenario(uponType = ScenarioType.NORMAL)
    public void beforeScenario() throws Exception {
        cleanCookies();
        createScenarioContext();
    }

    @BeforeScenario(uponType = ScenarioType.EXAMPLE)
    public void beforeScenarioExample() throws Exception {
        createScenarioContext();
    }

    @AfterScenario(uponType = ScenarioType.ANY)
    public void afterScenario() throws IOException, ConfigurationException {
        System.out.println("***********************************After scenario******************************************");
        emptyBetslip();
        if (scenarioContext != null) {
            scenarioContext.cleanUpEvents();
        }
        scenarioContext = null;
    }

    @AfterStory
    public void afterStory() throws Exception {
        stopBrowser();
        if (executionContext != null) {
            executionContext = null;
        }
    }

    public void createScenarioContext() {
        if (scenarioContext == null) {
            scenarioContext = new ScenarioContext();
        }
        System.out.println("***********************************Before scenario******************************************");
    }

    public void emptyBetslip() {
        final BetSlipModeComponent betSlipModeComponent =
                LiveBettingPageFactory.getLiveBettingPageImpl().getBetSlipModeComponent();
        if ((betSlipModeComponent != null) && betSlipModeComponent.getBetslipCountFromHeader() != 0) {
            final BetSlip betSlip = LiveBettingPageFactory.getLiveBettingPageImpl().getBetSlip();
            final List<BetSlipSelection> betSlipSelections = betSlip.getBetslipSelections();
            for (BetSlipSelection betSlipSelection : betSlipSelections) {
                betSlipSelection.delete();
            }
        }
    }
}
