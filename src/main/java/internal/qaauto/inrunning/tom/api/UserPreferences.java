package internal.qaauto.inrunning.tom.api;

import internal.qaauto.framework.Assert;
import internal.qaauto.framework.ConfigManager;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import org.apache.commons.configuration.ConfigurationException;
import org.json.JSONException;
import org.json.JSONObject;

public class UserPreferences {

    private String resourcePath;

    private String PREFERENCE_GET_RESOURCE_PATH = "/live/api/bet/preference/all";

    private String PREFERENCE_PUT_RESOURCE_PATH = "/api/bet/preference";

    private String TRANSPORT_PROTOCOL = "https://m.";

    private String baseURI;

    private static String SERVICE_NAME = "";

    private String preferencesResponse;

    public UserPreferences() throws ConfigurationException {
        baseURI = TRANSPORT_PROTOCOL + ConfigManager.getHostName();
    }
    
    private Client getClientBuilder(){
        return ClientBuilder.newClient();
    }

    public void getPreferences() throws Exception {
        final Client client = getClientBuilder();
        final String retrievePreferencesURL = baseURI + PREFERENCE_GET_RESOURCE_PATH;
        final WebTarget preferenceResourceTarget = client.target(UriBuilder.fromPath(retrievePreferencesURL).build());
        final Invocation.Builder invocationBuilder = preferenceResourceTarget.request();
        invocationBuilder.accept(MediaType.APPLICATION_JSON_TYPE);
        Response response = invocationBuilder.get();
        Assert.assertTrue(response.getStatus() == 200, "Successfully retrieved preferences","Problem while retrieving");
        preferencesResponse = response.readEntity(String.class);
        System.out.println("Harish:" + preferencesResponse);

    }
    
    public void updatePreferences() throws Exception{
        final Client client = getClientBuilder();
        final String postReferenceURI = baseURI + PREFERENCE_PUT_RESOURCE_PATH;
        final WebTarget preferenceResourceTarget = client.target(UriBuilder.fromPath(postReferenceURI).build());
        final Invocation.Builder invocationBuilder = preferenceResourceTarget.request();
        getPreferences();
        String response = invocationBuilder.post(Entity.entity(preferencesResponse, MediaType.APPLICATION_JSON_TYPE),String.class);
        System.out.println("Response :" + response);
        
    }

    public String getBettingMode() throws JSONException{
        final JSONObject preferencesJSON = new JSONObject(preferencesResponse);
        return preferencesJSON.getString("bettingMode");
    }
    
    public String getDefaultAmountInCents() throws JSONException{
        final JSONObject preferencesJSON = new JSONObject(preferencesResponse);
        return preferencesJSON.getString("defaultAmountInCents");
    }
    
    

}
