package io.swagger.client;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.List;
import io.swagger.client.model.*;

public class JsonUtil {
  public static GsonBuilder gsonBuilder;

  static {
    gsonBuilder = new GsonBuilder();
    gsonBuilder.serializeNulls();
    gsonBuilder.setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
  }

  public static Gson getGson() {
    return gsonBuilder.create();
  }

  public static String serialize(Object obj){
    return getGson().toJson(obj);
  }

  public static <T> T deserializeToList(String jsonString, Class cls){
    return getGson().fromJson(jsonString, getListTypeForDeserialization(cls));
  }

  public static <T> T deserializeToObject(String jsonString, Class cls){
    return getGson().fromJson(jsonString, getTypeForDeserialization(cls));
  }

  public static Type getListTypeForDeserialization(Class cls) {
    String className = cls.getSimpleName();
    
    if ("Periodicity".equalsIgnoreCase(className)) {
      return new TypeToken<List<Periodicity>>(){}.getType();
    }
    
    if ("Directive".equalsIgnoreCase(className)) {
      return new TypeToken<List<Directive>>(){}.getType();
    }
    
    if ("BoxInformations".equalsIgnoreCase(className)) {
      return new TypeToken<List<BoxInformations>>(){}.getType();
    }
    
    if ("Plugin".equalsIgnoreCase(className)) {
      return new TypeToken<List<Plugin>>(){}.getType();
    }
    
    if ("Device".equalsIgnoreCase(className)) {
      return new TypeToken<List<Device>>(){}.getType();
    }
    
    if ("Group".equalsIgnoreCase(className)) {
      return new TypeToken<List<Group>>(){}.getType();
    }
    
    if ("InlineResponse200".equalsIgnoreCase(className)) {
      return new TypeToken<List<InlineResponse200>>(){}.getType();
    }
    
    return new TypeToken<List<Object>>(){}.getType();
  }

  public static Type getTypeForDeserialization(Class cls) {
    String className = cls.getSimpleName();
    
    if ("Periodicity".equalsIgnoreCase(className)) {
      return new TypeToken<Periodicity>(){}.getType();
    }
    
    if ("Directive".equalsIgnoreCase(className)) {
      return new TypeToken<Directive>(){}.getType();
    }
    
    if ("BoxInformations".equalsIgnoreCase(className)) {
      return new TypeToken<BoxInformations>(){}.getType();
    }
    
    if ("Plugin".equalsIgnoreCase(className)) {
      return new TypeToken<Plugin>(){}.getType();
    }
    
    if ("Device".equalsIgnoreCase(className)) {
      return new TypeToken<Device>(){}.getType();
    }
    
    if ("Group".equalsIgnoreCase(className)) {
      return new TypeToken<Group>(){}.getType();
    }
    
    if ("InlineResponse200".equalsIgnoreCase(className)) {
      return new TypeToken<InlineResponse200>(){}.getType();
    }
    
    return new TypeToken<Object>(){}.getType();
  }

};
