import com.google.api.gax.paging.Page;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.bigquery.BigQuery;
import com.google.cloud.bigquery.BigQueryOptions;
import com.google.cloud.bigquery.FieldValueList;
import com.google.cloud.bigquery.Job;
import com.google.cloud.bigquery.JobId;
import com.google.cloud.bigquery.JobInfo;
import com.google.cloud.bigquery.QueryJobConfiguration;
import com.google.cloud.bigquery.TableResult;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

public class BigQueryQuery {

  public static void main(String... args) throws IOException, InterruptedException {
    // TODO(developer): Sostituisci queste variabili prima di eseguire l'esempio.
    String projectId = "il-tuo-id-progetto";
    String datasetName = "il_tuo_dataset";
    String tableName = "la_tua_tabella";
    String pathToServiceAccountKey = "/percorso/del/tuo/file-chiave-account-servizio.json";

    // Carica le credenziali dal file JSON dell'account di servizio.
    GoogleCredentials credentials;
    File credentialsPath = new File(pathToServiceAccountKey);
    try (FileInputStream serviceAccountStream = new FileInputStream(credentialsPath)) {
      credentials = ServiceAccountCredentials.fromStream(serviceAccountStream);
    }

    // Istanzia un client BigQuery.
    BigQuery bigquery =
        BigQueryOptions.newBuilder()
            .setCredentials(credentials)
            .setProjectId(projectId)
            .build()
            .getService();

    // Definisci la tua query SQL.
    String query =
        String.format("SELECT name, state, year, number FROM `%s.%s.%s` LIMIT 10",
            projectId, datasetName, tableName);

    // Crea una configurazione per il job di query.
    QueryJobConfiguration queryConfig =
        QueryJobConfiguration.newBuilder(query)
            // Utilizza un ID job univoco per evitare di riutilizzare i risultati della query memorizzati nella cache.
            .setJobId(JobId.of(UUID.randomUUID().toString()))
            .build();

    System.out.println("Esecuzione della query: " + query);

    // Esegui la query.
    TableResult results = bigquery.query(queryConfig);

    // Stampa i risultati.
    for (FieldValueList row : results.iterateAll()) {
      String name = row.get("name").getStringValue();
      String state = row.get("state").getStringValue();
      long year = row.get("year").getLongValue();
      long number = row.get("number").getLongValue();
      System.out.printf(
          "Nome: %s, Stato: %s, Anno: %d, Numero: %d%n", name, state, year, number);
    }

    System.out.println("Query eseguita con successo.");
  }
}